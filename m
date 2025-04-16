Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C323BD05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803481; cv=none; b=rtbfGftL5Lt7+spRa7RgZpGbA0zchQYfobIvZVJVtp6+Jgne7RRZJgc9634k13O8aGISvkEUTnfQCqp3wFYLYPGa9OXIaIsvV028HiTy2Xu5YTcnpl1+zdDObd/NPm4QnS0RsCluAJ6tpK7N7CABVy0XIPPITh0865nzL9Ei9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803481; c=relaxed/simple;
	bh=NIEMWJ202D6mf6fcNO+4/M6n6FIUXpU+76alA/gntPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuuYvISgXnatMNP2vkzxaxfjrqbaEUoySemzceO3qwk2SzRcME9FAAtvVAbP9WdtnHF21Lac3jC7WKDy1QD+P1R+aeMTN4LcyjWgk6hi05uEkvrtczhhlWL6VXeOPZm7wHg2G0EKOkWgbOZdG6oShow+2c/bwSERkw76oBhZ9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BTC2rV/G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/GuvRFs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BTC2rV/G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/GuvRFs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTC2rV/G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/GuvRFs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BTC2rV/G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/GuvRFs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0FAC31F445;
	Wed, 16 Apr 2025 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744803478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaJNEJXPtKVDt8D2A5CGTWjNYCi/03bMPqgixngTlpo=;
	b=BTC2rV/GlUNo8pqagMKyoFg4XxPG95A2VFylBOR7FPKovtFR5EABN8zDHIjFb7Dax8PbY6
	nfYq6iXAUh3NQKBkN2VlKaKnbbmr+P6WUqRruhRYLAFrLQG49NHT8Zmet5Q28JnGMD0dYp
	mbeZ6cARAp2k+qtrPPQe6IVvZKpE2PU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744803478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaJNEJXPtKVDt8D2A5CGTWjNYCi/03bMPqgixngTlpo=;
	b=Z/GuvRFsENdel0r4NV/n640xSFVC1Su5lQqetv4KbPGUhCOkZLuhCPKLPfq2MIdcUZZ3Kh
	VZrgAl5YeP8/+5Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744803478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaJNEJXPtKVDt8D2A5CGTWjNYCi/03bMPqgixngTlpo=;
	b=BTC2rV/GlUNo8pqagMKyoFg4XxPG95A2VFylBOR7FPKovtFR5EABN8zDHIjFb7Dax8PbY6
	nfYq6iXAUh3NQKBkN2VlKaKnbbmr+P6WUqRruhRYLAFrLQG49NHT8Zmet5Q28JnGMD0dYp
	mbeZ6cARAp2k+qtrPPQe6IVvZKpE2PU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744803478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaJNEJXPtKVDt8D2A5CGTWjNYCi/03bMPqgixngTlpo=;
	b=Z/GuvRFsENdel0r4NV/n640xSFVC1Su5lQqetv4KbPGUhCOkZLuhCPKLPfq2MIdcUZZ3Kh
	VZrgAl5YeP8/+5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 009A513976;
	Wed, 16 Apr 2025 11:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jtbKOpWW/2fXGQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 16 Apr 2025 11:37:57 +0000
Date: Wed, 16 Apr 2025 13:37:53 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] nvmet: add command quiesce time
Message-ID: <db5ce3ae-d8a9-4d8d-acd8-d696654c77e7@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-1-95a747b4c33b@kernel.org>
 <20250410090022.GF1868505-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090022.GF1868505-mkhalfella@purestorage.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Thu, Apr 10, 2025 at 02:00:22AM -0700, Mohamed Khalfella wrote:
> > --- a/drivers/nvme/target/nvmet.h
> > +++ b/drivers/nvme/target/nvmet.h
> > @@ -671,6 +671,7 @@ bool nvmet_subsys_nsid_exists(struct nvmet_subsys *subsys, u32 nsid);
> >  
> >  #define NVMET_KAS		10
> >  #define NVMET_DISC_KATO_MS		120000
> > +#define NVMET_CQT		1
> 
> Setting CQT to 1 is a promise to initiator that target will quiesce
> pending requests in 1ms after it detects loss of kato traffic. For
> initiator, it means these requests can be retried safely in 1m after
> kato delay. Is this guaranteed by target?
> 
> I thought leaving the value 0 means CQT is not implemented, no?

I decided to go with the first clause (9.6.2 End of Controller
Processing of Outstanding Commands)

- If the CQT field (refer to Figure 312) is non-zero, wait for the
  amount of time indicated in the CQT field to elapse; or

- If the CQT field is cleared to 0h, wait for an implementation specific
  amount of time (e.g. 10 seconds). The host should allow this value to
  be administratively configured.

The nvmet doesn't need the CQT thus set it to the smallest amount of
time. But yes this should be configurable for testing purposes with
blktests.
