Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148F214238
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365273; cv=none; b=lTQHTJAkZmOrn0T1snI/qefX+hi8pOx9ELkq5k4aplATRySC0CNaouimjMf6QlmmK3Z5eJi/EGoRpXzLmZC5elpFQPLMPnAT0IjSVFJHzZwgGS1Ez8nLfRMoxNOeP0ZYZVD9LV9HBY+ZdGHLUKFTY5l9H3Wtn9W8VC0WeBVJLVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365273; c=relaxed/simple;
	bh=Je+XbTDpM7XoCA2l6SPO6P6zZ4dfGXa2/Zffo3Wvq4w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BwzocSENh2SpgqE3BPzVTGPzaYYX3WrFEOcrpAyio74LtE5w6cVsUB9CO8jfdQ2QL8myXtfFK59vqY0N8Kg5WBiyux6IycjR6FNsVZSsJ7RQ7G3ehsEH5Btx1bBXLSbIQj9LfPGbryovnJkOk2eQxJqZpUgao3boSxt2cny9l/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=phfaszqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="phfaszqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE33C4CEE9;
	Tue, 22 Apr 2025 23:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745365272;
	bh=Je+XbTDpM7XoCA2l6SPO6P6zZ4dfGXa2/Zffo3Wvq4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=phfaszqXOfy+MdNxac3DKdmP1eHQIAZO+lIpb3jy7JpwOyA7AaqfWXkw7Pjous3Uo
	 8FhqLlTt+/vVJ/3cQfPoCY1HAJTXxmdHkp1TnYOcE9K7fslPg0U6dFmtOm1uoABexm
	 wNjrbaKaDrwJfRhdAWc3qJsQv/flhqcvVq+IJUUk=
Date: Tue, 22 Apr 2025 16:41:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shivank Garg <shivankg@amd.com>
Cc: <shaggy@kernel.org>, <willy@infradead.org>, <david@redhat.com>,
 <wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
 <donettom@linux.ibm.com>, <apopple@nvidia.com>,
 <jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>,
 <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as
 inline function
Message-Id: <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
In-Reply-To: <20250422114000.15003-2-shivankg@amd.com>
References: <20250422114000.15003-1-shivankg@amd.com>
	<20250422114000.15003-2-shivankg@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 11:40:03 +0000 Shivank Garg <shivankg@amd.com> wrote:

> Rename the previously static folio_expected_refs() to clarify its
> purpose and scope, making it an inline function
> folio_migration_expected_refs() to calculate expected folio references
> during migration. The function is only suitable for folios unmapped from
> page tables.
> 
> ...
>
> +/**
> + * folio_migrate_expected_refs - Count expected references for an unmapped folio.

"folio_migration_expected_refs"

It's concerning that one particular filesystem needs this - one
suspects that it is doing something wrong, or that the present API
offerings were misdesigned.  It would be helpful if the changelogs were
to explain what is special about JFS.

