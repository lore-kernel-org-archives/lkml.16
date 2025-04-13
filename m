Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C82AD58
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744506466; cv=none; b=GVaG5HHnxhOqg/H3tYZCMVs4FtgueaFs7TiQzNsTYU6CyyM1GC3vSnAm792qU4jYMR7Rwc+DtwGiJsA5+8APqPe1yYBu0INgOKzTY1yIi3CwLmhJHZ4liBU/W7pWm5nj4DIHuQWs2vSuzNQSgj3Mdt7rlSZY37AwEwURdstOMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744506466; c=relaxed/simple;
	bh=CPEQfJwi5C5khrMBEU3VOoCtmrrifbDvVLlnmmXC8D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI6pKA5gvCIpKGx41VSpKkCkBeOZC53JEoOoOegEPbJzm7QpZ/mT6HHZYVqRz2+R8UywnrDVUniCkFlKlAyCu1lffQMqRkp90YXIkjG8EyPPCDTBldypzUFr/dtvQabecRZzGPLu4f37qmZm1TRgT0DCjGNyWAJYOUegrftkvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=esIl2xvw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esIl2xvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744506462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03+uly0NYJpu0OTtZ8HRkaQGJ563a6TC/2I8HSCmiVg=;
	b=esIl2xvwRpHcK/eDp0n0XYQ/AP+7H2tfXwHS3aGnEkziiSYTDcErQNML4/FEE+fUaZmWHO
	qA+7bYIiDG8S1uAhQIkNhT7CT11byVPizVg0BYHD0XL5crWJy9XSRaCzTKI7HHs772WXfq
	aydelnz4BlAIBtPc/muQVLmlZeNKPTQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-9u9wwuz_PqWbNX-TvH21fw-1; Sat,
 12 Apr 2025 21:07:38 -0400
X-MC-Unique: 9u9wwuz_PqWbNX-TvH21fw-1
X-Mimecast-MFC-AGG-ID: 9u9wwuz_PqWbNX-TvH21fw_1744506457
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C4F51956087;
	Sun, 13 Apr 2025 01:07:37 +0000 (UTC)
Received: from localhost (unknown [10.72.112.43])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67C4D3001D15;
	Sun, 13 Apr 2025 01:07:33 +0000 (UTC)
Date: Sun, 13 Apr 2025 09:07:29 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, osalvador@suse.de,
	yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mm/gup: clean up codes in fault_in_xxx() functions
Message-ID: <Z/sOUfK0VoiC7d+w@MiWiFi-R3L-srv>
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com>
 <f03f7e13-3d37-4d4a-87a6-61731744f476@redhat.com>
 <Z/j5y6frIT2jIsv7@MiWiFi-R3L-srv>
 <332ce477-59f6-47f9-9687-10b642b86230@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <332ce477-59f6-47f9-9687-10b642b86230@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/11/25 at 01:41pm, David Hildenbrand wrote:
> On 11.04.25 13:15, Baoquan He wrote:
> > On 04/11/25 at 10:54am, David Hildenbrand wrote:
> > > On 10.04.25 05:57, Baoquan He wrote:
> > > > The code style in fault_in_readable() and fault_in_writable() is a
> > > > little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
> > > > and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
> > > > in fault_in_safe_writeable(), local variable 'start' is used as loop
> > > > cursor. This may mislead people when reading code or making change in
> > > > these codes.
> > > > 
> > > > Here define explicit loop cursor and use for loop to simplify codes in
> > > > these three functions. These cleanup can make them be consistent in
> > > > code style and improve readability.
> > > > 
> > > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > > ---
> > > >    mm/gup.c | 65 +++++++++++++++++++++++---------------------------------
> > > >    1 file changed, 26 insertions(+), 39 deletions(-)
> > > > 
> > > > diff --git a/mm/gup.c b/mm/gup.c
> > > > index 77a5bc622567..a76bd7e90a71 100644
> > > > --- a/mm/gup.c
> > > > +++ b/mm/gup.c
> > > > @@ -2113,28 +2113,24 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
> > > >     */
> > > >    size_t fault_in_writeable(char __user *uaddr, size_t size)
> > > >    {
> > > > -	char __user *start = uaddr, *end;
> > > > +	const unsigned long start = (unsigned long)uaddr;
> > > > +	const unsigned long end = start + size;
> > > > +	unsigned long cur = start;
> > > 
> > > I would initialize cur in the for loop header, makes the loop easier to
> > > read.
> > 
> > Both is fine to me. It's to satisfy checkpatch.sh which complains about
> > exceeding 80 char in the line.
> 
> Did checkpatch.sh actually complain? You might be happy to learn that the
> new limit is 100. :)

That's great to know. I never noticed this and always wrap via vim's
indication.

> 
> [...]
> 
> > > /* Stop once we overflow to 0. */
> > > end = PAGE_ALIGN(end)
> > > if (start < end)
> > > 	end = 0;
> > > 
> > > for (cur = start; cur != end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
> > > 	unsafe_put_user(0, (char __user *)cur, out);
> > > 
> > > Essentially, removing the "cur" check from the loop condition. Not sure if
> > > that is better.
> > 
> > The current code is simpler. Your now saying may save the CPU execution
> > instructions a little bit. Both is fine to me.
> > 
> > I don't have strong preference, I can make v4 to address these concerns
> > if decided. Thanks for careful checking.
> 
> Whatever you prefer!

Great, will make change in v4. Thx.

