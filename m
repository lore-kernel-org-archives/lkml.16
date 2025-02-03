Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9F288B1;
	Mon,  3 Feb 2025 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586592; cv=none; b=FOCou0HmTraexQn1GZQIzZGl1cPAC8CilPUWVsKUwYwB+MhGitwYYFAx/CUUfV8IVsm016RYZujc7HUVrAy3gJfDFEIpoFmG5tr/42dsIPZ9F0AwEwQYwbZVTB1F48wrWpET3ejDnb2wKN6f6ztqG+32OAPrV6JSdyURmlt7vDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586592; c=relaxed/simple;
	bh=uMZAKkK5D25aJDOgeTK29oJ/eAUOhtihM+XgpzmQZL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXvuNeqI+Hjy6kvSEOT2wH2fOHICaZv14nRBvDZ1odNtNjprb0L1EjTFedV4ERJfty2KNnU12CKbByLNSr4Rk3QTH47F9oBqnZV005Ri6IrPrMjN6vWGEqhVcQBDY5ynNdAfwv/A5QGJMmOaTlpHPCOJdaXAmMaPps339ZCdyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbK2OVVP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbK2OVVP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso79435975ad.1;
        Mon, 03 Feb 2025 04:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586590; x=1739191390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=odL74vy7Rutoy0JWwQwhB4Miwo0z1XxrQgmH3YoA8dQ=;
        b=jbK2OVVPTKL/YFNd4kKrpUNJ3vdGzW9+iIC5eXuaxe3JSsdGptrva0/mtKVTisNBmA
         6q4RBG1IdMfcHMNLZWfzEBTLi9W57ztoqk1IMFsAJGhXXEg7DSN1lyugZj5ZOGL+JKnO
         JjxNvAL4PfDxc9SfWPhad+KkurtSRo+KwU+BqaubcDk/tc4dKtSPLw6EuPIfJEmi1e88
         6EiiLr9o0vTLlDy3HSfSrw9PaB9SnUiGma7LnuwJGe4CySJP8A8n0JaNNnsxgJrLfsfM
         eqHam5FZsFaabBmpFkrA800pBxLTc6TsJuZjxyK6jr8qSvVeTxesOuXGIgkaB6Mn5W2I
         Xg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586590; x=1739191390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odL74vy7Rutoy0JWwQwhB4Miwo0z1XxrQgmH3YoA8dQ=;
        b=KcXsXLuf43MlZ9wcwUwO/9a9Qa2kx+42jC9yYLR9dDJ/Ophys6OZ+DuZqG7XFeAfkb
         qWuDW5uq3PW2vhreyKReRwkx4L9HTv964q+KMphxi3avH3D3atbroC5O3Qm+u35FgRxq
         rhtjWqaCopZ871ipBPmJGVD/fGxzrtlh84mpDdK+D61tB4f8+kXMjUnBlc/dpIrErA47
         qUuahn6H96/RO681cF2hGlXjL06d+B0uOxfvm1cYeF7LlZ5zonj/SaFZgpnRx/2BxX/o
         h5wBTqDPQr9jTr+xfasN3F5tHz1zzcn/0bdyC30pgZvL3dBNZVUuLGRbMj6CqiJ8pVyl
         uTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6bIKIRRLQdRf0LSuNaXFgXuysV8jfOTQJD5knZ/zmx+QTIzLsZel6NG7n4E/GJ18nB3ipO8IYF1n@vger.kernel.org, AJvYcCWoKVAfv2+97aqPzo2+jbwtoWaCfuyDZhLiLZD9+QuYsLA1Af0tAiTGQkoYN4cYqHUC+W5y6eqYhofiQdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2p1Z336X6+BqjMfc/vTjNVJYn8SuyWHnVTvoAuLB3cwoDb3ma
	5En5k7R+68jTY5w/Krg2wIlIUgm4idtln6IqmoZM8cTc4JSfAuwe
X-Gm-Gg: ASbGncvUO5k0dZitpEUcBhuitXrIcvseu7YCRcjP5WEbRr+7fDAO7yPYAVclHatwA4s
	wH+W7gsB+MpBfgoTEIQttinAgL4VNHckG+uUaIK/MqqN1ZvdDXMj6SVUZD0uK3RwSB+BKXfX2uP
	+xrumANh7OSTfthSSTnRlnUXJiYKnFxONXhnvSxhwu/58tVwxGl3KC8wyb8gpB7Mns/A6vSVG9i
	cnSN0NRrj1+zDGNVxdH3wwn1f5KJGKUZjqVtHOTVbpymRE/rpQ8i+rHcb0c/s1mkHyX4kLb5Lv8
	6HWdg7ySjr1cEg==
X-Google-Smtp-Source: AGHT+IFgwkDsBKX3XhPHR05JLdZ4GbPgqRKDeXuUSgRSm+zQTjLCWOHwmD3T933uH5AYrluhLcIQtQ==
X-Received: by 2002:a17:902:db09:b0:216:6f1e:5799 with SMTP id d9443c01a7336-21dd7deef93mr365520295ad.35.1738586589479;
        Mon, 03 Feb 2025 04:43:09 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfc0ddbsm11132302a91.45.2025.02.03.04.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:43:09 -0800 (PST)
Date: Mon, 3 Feb 2025 12:43:04 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
 <20250203123944.GJ3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203123944.GJ3713119@black.fi.intel.com>

Hello again.

On Mon, Feb 03, 2025 at 02:39:44PM GMT, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> > Hello.
> > 
> > On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > > Hi,
> > > 
> > > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > 
> > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > published in September 2024, the rationale for this change is:
> > > > 
> > > >   "Since the default value of the Target Asymmetric Link might be
> > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > >   Recovery flow before doing Asymmetric Transitions."
> > > > 
> > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > 
> > > I did some minor modifications and applied to thunderbolt.git/next. Please
> > > let me know if I missed something.
> > > 
> > 
> > Looks great. Just one question:
> > 
> > In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> > the link recovery status. Is that okay?
> 
> Good question :) Looking at the ECR, does it actually say anywhere that the
> CM should needs to re-enable it? I'm thinking that we could just disable it
> and be done with it?

Right. Thanks for clearing that up.
