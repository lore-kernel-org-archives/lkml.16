Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718272A1BB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772238; cv=none; b=VD8wnFEiVqynefXDlS5rlkISA0jDe0LrbciWRhj/+YgCV9u071m8JzAj6xKzvR/sdQlNXrpXHbSaFkkK2HbPSKy+kxO/07fBIjRUehH0uzzCGlw8dD2Rqi8sJJ/240vF95z9IwYWRm+vzeyuPRTfY1UMawYO65KAo1y5/3nnTi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772238; c=relaxed/simple;
	bh=YhF9y8OoxI/cJBN8DuJJz+G9B9devp5ykYuUcR8SJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD9AIuZf6poFxNWRWWYg5Kvjh2UOP1CWwc6vt5eNrLn6sFxQ+a4JeIn0gE6kpJrC9pmJUbz2gvLYq+HPLq9S8QTbGA3N4F/JjRuBTNdOi4Q3DwwoutfQ2YBQFx8mb/Oib1PmTNfFwMP3Ww8QcZFydwMKWlNuFXrJ7CrfFMmRk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUcAMAwi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUcAMAwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738772235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LdopIfX4wP4Klg7kSRH4KKuGlpJKVdsfDya+G9hlUS0=;
	b=FUcAMAwiYAtDghwC1YkeMMSIMkS5uxbIylzr4KLSqPefc+DQjBeqyjxuswbtrKHdrN404r
	TxNeQygmvN4/ZKaVg3Xj13ft9OTrSdN7htpWTjfauyJ2TzpC2FnAX7A+TX8R7VCyFgeRoc
	Vy92TIXob41oQxo2WTteUZZu9cRopGU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-cZq68m_kMkW2Hg4imzDWmQ-1; Wed,
 05 Feb 2025 11:17:11 -0500
X-MC-Unique: cZq68m_kMkW2Hg4imzDWmQ-1
X-Mimecast-MFC-AGG-ID: cZq68m_kMkW2Hg4imzDWmQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02FF019560AA;
	Wed,  5 Feb 2025 16:17:10 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4DF1D19560A3;
	Wed,  5 Feb 2025 16:17:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 17:16:43 +0100 (CET)
Date: Wed, 5 Feb 2025 17:16:37 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pipe: introduce struct file_operations
 pipeanon_fops
Message-ID: <20250205161636.GA1001@redhat.com>
References: <20250205153302.GA2216@redhat.com>
 <20250205153329.GA2255@redhat.com>
 <CAHk-=wiqUibNm0W-KcCb3H+aiSVr4Uz3COZq=LjqGd__6guFEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiqUibNm0W-KcCb3H+aiSVr4Uz3COZq=LjqGd__6guFEg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 02/05, Linus Torvalds wrote:
>
> On Wed, 5 Feb 2025 at 07:34, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > So that fifos and anonymous pipes could have different f_op methods.
> > Preparation to simplify the next patch.
>
> Looks good, except:
>
> > +++ b/fs/internal.h
> >  extern const struct file_operations pipefifo_fops;
> > +extern const struct file_operations pipeanon_fops;
>
> I think this should just be 'static' to inside fs/pipe.c, no?

I swear, this is what I did initially ;)

But then for some reason I thought someone would ask me to export
pipeanon_fops along with pipefifo_fops for consistency.

OK, I will wait for other reviews and send V3.

Oleg.

