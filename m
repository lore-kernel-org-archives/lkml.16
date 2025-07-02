Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3646155A30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462287; cv=none; b=oDs3lmkGthF7ImcLMPvqrLN54iEagV8LgJLtGvV9QniRHQUd/bKvGf5vVtiGIkwxXhJyTmPRmMuTqakFqj45h2CSobQuBuwoctVKUYkJ4XbhES0hDfrzMClAyLwMSU/RACAyPIO1TEwAeWP5KRYOw1IAYw+K++7P19k7lhebZ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462287; c=relaxed/simple;
	bh=5kZlihYIZFmatXI4cBGB+TFOdpXZ12A7UPeui5kT3wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ev6ZN/2sHfPCSmkQwV1XAlQwEgWFdqtRn1cHicgJZmMgdcXIHi+ffkBa9GVj1uebstiCGLrQQ2hXylcXo20+HlM/klCDZDvOVPZHFQ973G3Q86OBdhCOZeEbsx9C4/O+FneJGuPg0YcJLEhxrBCCKcNkPpteeQFb7Mu/dxPhuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OrKKARZv; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OrKKARZv"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so3818078a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751462285; x=1752067085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz23Tyg/+cYmV17yzTrHH8B+H8AlynLVnYk/5oZAsnA=;
        b=OrKKARZv8psod2z7g4d9SL5QvcXG/puN9MiuhOZ2cR0S7A+s2F+V2qP0eZaFxV2PuQ
         FMb+s28Yy8kYEsxsmG1ZMb458A+GPuDibC6YXlmnSTJJyWnh0WLUGtsCWrFBffK9/kU/
         PYgBhFfCHzvNtH5UjNVjfPibwvbqY/b3sGibgVqKGmdR9F8WxaGulbmvnAbkvTGk0qJC
         z1xkS2TrCOAxGEhdiBK8E7dIKRVN1DV86sozCOXoJ3ZF9h20WNYKL8yreSDnOjbCKQgs
         ZW1wpRLlBkSt8jwK6NxfsV/SESGY1HUo0XRgg8Arj6amgRKnDLE3wPMjeheWwsjgd2rx
         JjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462285; x=1752067085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz23Tyg/+cYmV17yzTrHH8B+H8AlynLVnYk/5oZAsnA=;
        b=H1KhxUmCvddHc7/kb4HiyvXLCmRMN+V4HD90TrCCDM31zioGdYyY0Uet3rsN4lncaF
         2uz7Ew0cpiieDFGlR11LcX2GqKL16nxLeAR63brjI6ZYfFjrPNsEgFXkWuE6RmHfdfvR
         hHA/fplKHpKir/YJ+IQpqkl/dXvwypvxEuPhEOgleKggJDSQRaiSiyZzH1kA8h94ifF6
         ek4/CuEi9+loO9x410/4v33KFVzn584oCHPDCoMz3s3lgmwyMtTcASH+4nl+WWJqr7P6
         J9PsBiA9UrwquyCZKKMZN1coE7QjDrHTKTQbcPOhe24bQxx36DiDoz4XP3QQ96F+1BJ/
         73jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZb/IVV0yefufL09VBsb34Q3wDoTOrCJu75pt8Sh3rwin75eP2oWOb9eEHRSidbidBPlv0LWZZgkIURwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6FZ6tHG8Eu/qL4inxtDO7tHtPHBEq339zVeXQ8ld48XAFjra
	nU6K9Zepsd9Lsrr/HFn2LAHN6L5PZF7gPO5WweW1gsba1l0Lr3U6qT1jH+pjAE1juc4=
X-Gm-Gg: ASbGncu+ChMfsfqhJot3nhNdKxN9xiFhKnnQMxZkQYgh7RQ0j6feU8EfeFkoUIoEUVr
	jtUvekKlZEcD8wKU9KtgMknGeXdpRaj8bOLzicbF1H5ainTPgrL5s8LjRJ5v6tAok5B3IArTe0a
	4oPkFWeB4yXtu4YFNd2iCkcIsOrjes+B1E6p654dLONEc6l3x+6u1jXh1Lvxk2bdeEpnwo9rHQS
	S0hFITCP/Qd+itg8fdQGCIR0nvsjZ812O71b6xn9iHXaIxGlP7tQwux1Jz1IDxpsrsLCCyepZoE
	1yQogkoMVyNoa6JbObyAnSVjOl9340uM2dA+svkL3uHIiQQ=
X-Google-Smtp-Source: AGHT+IEGc1zq93nkJMavPRth5ri3c2hUYnAePkxmcp9zyThS7yDUwDvLudNNxEfu++eq0S0smDF4tg==
X-Received: by 2002:a05:6300:6199:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-222d7defa65mr6135557637.14.1751462285065;
        Wed, 02 Jul 2025 06:18:05 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300d02bsm12981443a12.6.2025.07.02.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:18:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uWxLf-00000004c0r-0w5g;
	Wed, 02 Jul 2025 10:18:03 -0300
Date: Wed, 2 Jul 2025 10:18:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Abhijit Gangurde <abhijit.gangurde@amd.com>, shannon.nelson@amd.com,
	brett.creeley@amd.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
	andrew+netdev@lunn.ch, allen.hubbe@amd.com, nikhil.agarwal@amd.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Boyer <andrew.boyer@amd.com>
Subject: Re: [PATCH v3 10/14] RDMA/ionic: Register device ops for control path
Message-ID: <20250702131803.GB904431@ziepe.ca>
References: <20250624121315.739049-1-abhijit.gangurde@amd.com>
 <20250624121315.739049-11-abhijit.gangurde@amd.com>
 <20250701103844.GB118736@unreal>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701103844.GB118736@unreal>

On Tue, Jul 01, 2025 at 01:38:44PM +0300, Leon Romanovsky wrote:
> > +static void ionic_flush_qs(struct ionic_ibdev *dev)
> > +{
> > +	struct ionic_qp *qp, *qp_tmp;
> > +	struct ionic_cq *cq, *cq_tmp;
> > +	LIST_HEAD(flush_list);
> > +	unsigned long index;
> > +
> > +	/* Flush qp send and recv */
> > +	rcu_read_lock();
> > +	xa_for_each(&dev->qp_tbl, index, qp) {
> > +		kref_get(&qp->qp_kref);
> > +		list_add_tail(&qp->ibkill_flush_ent, &flush_list);
> > +	}
> > +	rcu_read_unlock();
> 
> Same question as for CQ. What does RCU lock protect here?

It should protect the kref_get against free of qp. The qp memory must
be RCU freed.

But this pattern requires kref_get_unless_zero()

Jason
