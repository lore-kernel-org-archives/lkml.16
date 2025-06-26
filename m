Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2B513AA2F;
	Thu, 26 Jun 2025 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954921; cv=none; b=p2zo5X/HkPo2xuzGnW88UkbUvSFQ/FAssQMhNYEIDRd/C9E7fL+0W5/xH7kh1rqo0UKBn8APiA1nypduke8zceCitV9krLY5pP6yF3+X/q3Y6oLBP9o9c9Uc1qTHhnVpjEezFUVpzkjhJvkmCVEfwbp1HEd01g49h/L0z8fRSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954921; c=relaxed/simple;
	bh=ej26oeDS0qNeVl6mceyLNLtA/g7T1hn30k25zjuX2/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfGBBOwhZ5ScdOIfLTd2VBVnhIEVw3OZShzss8hkruNAtKu+3dOhrfE+vJaOkO20P24kjnWnQsqpnByI/RUE6HmoV0YTnM83nljEIAFLX6hJoJaGsbBOArVL/VloL6yRBIo3EeOhLNhWVpxCXM3R71MDV8o/cZFpixs9AF/fFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIx6H1G8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIx6H1G8"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d09ab17244so113480585a.0;
        Thu, 26 Jun 2025 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750954918; x=1751559718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWIXM0LcfEvWnSHp+2ZRURJcSWBaaYki8atmOv/iMTI=;
        b=WIx6H1G8BzK1bTorlAHxGl8bBaux+o9Og5PYDghf0fY5qW793sKcpmdRhuMJSqLI4M
         I0vd2LnBwo4TSQUaaSl7YD1HS3sknXVss8pYuSnU0uOeO6dEpdSfdKgaKkNzeeeGFAkc
         zIUVpmC3qwCdZBI6CakWMZAtN1xFbgTIJ6TCdiziA4tjs36PY7MGarYGRJ+sDrUQMrWL
         yuzFhD62LXjW56h+g27a2u6hBccxrPMqWVnmIISO8wW5HZcQQrF+icW9u0Oh6Ee7UsTZ
         VjTLHz9ywLU+mMrBWdg5LWmEfpovT3WWXm88a2G4WowruS7OY6Za/i/9aerD4O9hDNF3
         CB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954918; x=1751559718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWIXM0LcfEvWnSHp+2ZRURJcSWBaaYki8atmOv/iMTI=;
        b=bkbISvc56NBSJy/ZD6ITHaVVij0k4i+ocuL+BMkKLQDLtzqMBxkBOsweDx/THmD8kA
         W4VPrEaIHJ+bcDwVP55DgbUXDvHqWSKPpkl6CrHIy5mgunCLFMygSpefD5m+wEK5VB9b
         wGN08OGJYm+Q/WvXyhb37Jpz3nteP3SmnRf5JjuOYAmWXsAhu98r++CyufO9Ch54ZDGW
         PNg3lZFhWLjQbYHZple0+6kiDW4Bl5M4dGBxgNFjOuY/IIyFdk3oPAvVzIYjVA5bH66c
         YJne+gOXicqHUXGBLj4XSOAQTzM00QTUmGbnm0zwbZTYMm2s4Qyuatrc9JlC1NofKD+w
         S3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUW8GnS67NpNiDyDhMJl9Gfdme7D1tV5kOmT0l3De+bzzlaJ5ZNDmu5f+Vfhp32mFzhHfkWd27UyfkB9vM=@vger.kernel.org, AJvYcCWz/x77bW81wvPjW50RkjLus2qoRJ0yF7p8vtAIFx7gSZzU2oRQxf3ugmLokBQSZ28/GtJxBqp2a9Oy8Cr/pco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6DpIl3Dg+8arbxAZlxKmB5AEZoXCz3t0TwT1UXDhl1pV1C9MG
	N42FEs4gAS+nOBK2nwkXlekAqx7E4HVr3hXKwpx6jRhxsMO5bpLNzCel
X-Gm-Gg: ASbGncuSLItyls3SHk6Be6v/txP65sS8x4+qPVwQ6CnZpomXY5bWkHKlBlT2t/H1wUq
	3mDWRH4ey/AO//+sYA/wv+wbAOcXM+dUUtDf2d5sehnJP67/g/Iz40pNj4oMS2AVy2/HqFVO1Fi
	Xi8SvgdlHZOiKEaqb7iDNCcVDSdapCLzR6u2x14qCeDwOp0V7hfywL1YRUclMr4buVYOBqoQjmm
	aXoR4F9BuAlYpaeHOboBZTX3cGHAIhW9CnbjZsTwcAnqoGwtgQ/vV9jdg2oY2MPetl6dSYAT2V6
	kGgB9iWwVRgIalom6US/3loEamkGKSVuvapscYDAANNEyJ8As2W4LgGFW8ahTW4/224mtx5T0WO
	2AroIp6wuFwkhlrPOJ1tEDeO6eLZwEyTwCN+Sb7J55aNrjq56shbW+0VgLdi/GaU=
X-Google-Smtp-Source: AGHT+IGrIm92n/ejEmNRBCCkghLgCoyV37PyVYbOsh8VTTF8Is58JZDwzBqt3FwCawce3YkAUu10SA==
X-Received: by 2002:a05:620a:8b13:b0:7d4:2854:7960 with SMTP id af79cd13be357-7d4439a86c5mr12122985a.48.1750954918336;
        Thu, 26 Jun 2025 09:21:58 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4432371d0sm17812285a.102.2025.06.26.09.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:21:57 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DCACFF40066;
	Thu, 26 Jun 2025 12:21:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 26 Jun 2025 12:21:56 -0400
X-ME-Sender: <xms:pHNdaFIf2dtyPbifkUr2rT9SzUph_VcV-44tDT0ADvznHKIAv9R93g>
    <xme:pHNdaBIeJPFQcTwoxFnSLFhiZJxIQ_sda4QUr_C88rYEvPwvoLAkvm1WDVboynLcy
    Z4NxYSr7HnxgqlBQg>
X-ME-Received: <xmr:pHNdaNtRXWsOrCWIyilmxhnkCwN8uS_ny7o0SVQMTfuiIeh4Ey2-4tsFpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    ephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedtnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthht
    oheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsoh
    hrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pHNdaGYIDjPnrl6yPannUcy2xFdbqspEDd7seaS-mmdqSxR8TUS7yg>
    <xmx:pHNdaMb70MbkxZZjVkLTs1HSBC_lm8cZlhZ1zl6VSupQEMRcPyuEzQ>
    <xmx:pHNdaKCznbgE-dFsVoiTdarDQYm9ZeLraUcGHdzqawdYoAeB5E-7nw>
    <xmx:pHNdaKbMpBQG4QRVNhBZm7evydhm0DXAGa2lNoPxE3VQ_NlQqC-8TQ>
    <xmx:pHNdaIoTwX92iwEEnmJnBqKzZqVLb88tR8F5jdun1r1CFWRH7zjHUq0E>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 12:21:56 -0400 (EDT)
Date: Thu, 26 Jun 2025 09:21:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: devres: require T: Send for Devres
Message-ID: <aF1zo_b3nJn6-_At@Mac.home>
References: <20250626132544.72866-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626132544.72866-1-dakr@kernel.org>

On Thu, Jun 26, 2025 at 03:24:46PM +0200, Danilo Krummrich wrote:
> Due to calling Revocable::revoke() from Devres::devres_callback() T may
> be dropped from Devres::devres_callback() and hence must be Send.
> 
> Fix this by adding the corresponding bound to Devres and DevresInner.
> 
> Reported-by: Boqun Feng <boqun.feng@gmail.com>
> Closes: https://lore.kernel.org/lkml/aFzI5L__OcB9hqdG@Mac.home/
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Boqun Feng <boqun.fenng@gmail.com>

Thanks!

Regards,
Boqun
