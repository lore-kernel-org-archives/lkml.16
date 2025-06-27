Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041A2746A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986258; cv=none; b=f7if0JBx7PHGv4X3NL8F4CdVa70wy25QPptUlnWpUvsgZyWqTYapba5aa7wky8okLYIK/gZp30atq6iFKyvsChn+Dspvr2JF0soC8buqdT84RFMXGDJJQFU2sxc8VjRxPIA+nELzIdtFZV4JAF2lp52zF+kobkGAq6cAGbdWIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986258; c=relaxed/simple;
	bh=zeC+iIpYdcOVvmwz3iWpMIo7n0ZyvT9VQrkbmEEEwxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4xUUiK8LkM+hgNz25SCmuS6Sr1GfUSL+wQ1XkrppyRpM1UevK7jg/ut7WJ+XeCzxiEl8GHRCawc05+MgmpZOVInG+2waPZuDzjE269a0BlpaVjoDMaHFGJ6YlGZOU4tPObi3FMDMvpvyMbfOZyYBjAdeUjSu9LW1M8bQtCKnbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nr0H93Wi; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nr0H93Wi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750986252; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=zzsOvPofranR4VW3KfgumZYrk2uPPq3zcvTSbWlvrRY=;
	b=nr0H93WiSSDw8P0dGta51GkuoYmY7GU0DQqf0AvL5zIqZUK2Gxi0uvAmCgXSE2ixjXoUVHBK0IsM2Ak1utQDDq6FsJe2R4wGmyjUM6n4F+Dusst7kQMhBRa2i43KIwACzDtT3JEy0F/Tnit3iiIWLPRZOt/nx3sDrm3901NaQXw=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WfKwkgn_1750986251 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Jun 2025 09:04:12 +0800
Date: Fri, 27 Jun 2025 09:04:11 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Cc: fengwei_yin@linux.alibaba.com, zhourundong.zrd@linux.alibaba.com
Subject: [Question] About the elf program header size
Message-ID: <sxokzxpo74u7yhrhfrmgtdvkpshwl464jicrwwkwtvkwl5d5dj@fqto77h2prj2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
We had a script generated assembly code. built it with gcc and the
output elf file had 78 program headers.

On an arm64 platform, if we have 64KB base page size, the elf can
be started correctly. But if we have 4KB base page size, the elf
can NOT be started with:
    cannot execute binary file: Exec format error

Look at the function load_elf_phdrs():
        if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
	                goto out;

ELF_MIN_ALIGN is defined as PAGE_SIZE on arm64. Which can explain
above inconsistent behaviors (from user perspetive).

I didn't find the limitation definition in ELF spec(Maybe I missed
some obvious info there). If I remove "size > ELF_MIN_ALIGN", the
same elf can be started correctly even with 4KB page size.

So my question is why we limit the who program headers total size
to PAGE_SIZE? git history couldn't tell anything because the
limitation was introduced when whole linux kernel tree was migrated
to git. Is there a possible constrain on other architecture? Thanks.


Regards
Yin, Fengwei

