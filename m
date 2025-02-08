Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7014A8B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976902; cv=none; b=Ti3N4b/ViToPWdmETyoYIBys/jvK6MMMTvqgEOYkF/r2vvw2ippIsbK3W7NwnFyfXwSV28UaYAqd4/jwq5xVPGMhRW7IhLPB6bycjstE196716Q4PCCjdl5T99F2IK9lHfnkoIvD6A5yZEKLqeid8sL0EvvY4GgJzrWRqLXJzvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976902; c=relaxed/simple;
	bh=bD9rOJNb+vnxn0lB0NJAYojp/zAwIuve72wDkO8PC5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/dHgGoa+prnM80tdDjgqUtrLKLMPmHR/Tp7hXQ6eLUn5UtKymicD377VgBAkn6K/5RC4N2POm38x6w0GPDvTVsfQ+MrDon9wkyFLeXzhg1Qc0XirxNQJYtNW54Gmi8I8Yp+mnqsg9DNzxCl2S9C8oqOEliLCcAMbpCQt10aSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ny0MU1D8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ny0MU1D8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738976899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtfwWOpr+HlJ/Tgq015gNWog2ySCjFtiPCDlievL+/8=;
	b=Ny0MU1D8+2oKCXLIrkeiGda+rHqC8gKunMqUkv4t8KjK9qAsjHccUfJlIhNef4WEKTiva8
	BMb/pa8Cb06GmLwkNcUrf0eeii8T8MRmlKOvMuSFGULwK+8BAdqBl9cOp7i+0eONziWw59
	48+ZmkQ2X2zQjGu+0xXqV2b5kgPi8js=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-KVbfTAv_P5G4VeEzMLVtEA-1; Fri,
 07 Feb 2025 20:08:18 -0500
X-MC-Unique: KVbfTAv_P5G4VeEzMLVtEA-1
X-Mimecast-MFC-AGG-ID: KVbfTAv_P5G4VeEzMLVtEA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25B2E180056F;
	Sat,  8 Feb 2025 01:08:17 +0000 (UTC)
Received: from localhost (unknown [10.72.112.20])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9FD130001AB;
	Sat,  8 Feb 2025 01:08:15 +0000 (UTC)
Date: Sat, 8 Feb 2025 09:08:11 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org
Subject: Re: [PATCH 00/12] Tiny cleanup and improvements about SWAP code
Message-ID: <Z6aue/RyKYL1Rzvm@MiWiFi-R3L-srv>
References: <20250205092721.9395-1-bhe@redhat.com>
 <CAMgjq7C_93Z8abbBb7Jfjd3iMAAs8EeLBmPOeXrR96NaVgz8cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7C_93Z8abbBb7Jfjd3iMAAs8EeLBmPOeXrR96NaVgz8cg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 02/07/25 at 05:36pm, Kairui Song wrote:
> On Wed, Feb 5, 2025 at 5:27 PM Baoquan He <bhe@redhat.com> wrote:
> >
> > These are all made during reviewing and learning below patchset from
> > Kairui.
> 
> Thanks, I've noticed some obsolete comments and code, currently
> refactoring many parts so some of the functions would be just gone
> someday.

Thanks a lot for reviewing, Kairui.

I have a queued patchset to refactor the old hdd/cluster code, it could
be made about 2 years ago. Then I heard you and Chris's presentation in
LPC in last fall, and your later rework patchset, just began to notice
the big change in swap code which is not what I knew. Sorry, didn't know
you are still refactoring the code, so will stop touching swap code, look
forward to seeing your new refactoring patches. I will keep an eye so
that I can follow the step to update my knowledge about swap code.

> But this surely cleans things up and is good to have, refactoring will
> take much longer time to happen.

Thanks again. Please help add me to CC when you post, I am interested in
the new change.

> 
> With the V2 update of "mm/swapfile.c: update the code comment above
> swap_count_continued()":
> 
> Reviewed-by: Kairui Song <kasong@tencent.com>
> 
> > [PATCH v3 00/13] mm, swap: rework of swap allocator locks
> 
> BTW, I noticed most patches here are patching legacy code, and not
> directly related to that series.
> Just to clarify, so people won't need to worry about missing "Fixes:"
> or things like that :)

LOL, right, at least people following the recent change of swap won't
misunderstand.

