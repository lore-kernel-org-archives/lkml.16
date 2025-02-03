Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C7201016;
	Mon,  3 Feb 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585528; cv=none; b=u/Ny8kdODxpHUtRiazRhhq0bvfoxyPCZrdknYOTN6m2r5MtxSJVQ5z9QVVQYZPeX43EXUmTzvEJzRQKUNHdZ8jb30mKfvSeR4z18lYsoS1wD3rnnCpET1RBVHoHsUcvQxoijMOspTpmFmpJBDzlaZGj+LBNC+K11xDBpTcoIfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585528; c=relaxed/simple;
	bh=Jx0tUDeK9QQM8yxTWsP8FNhUorvbUVvVZV10ygMt3rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8hKcKNaHc8XaBDFVbOyDqn8JASoSsUK9FzMzgka3ma449Jtgfjlp2/yDmgg1Cglh0bLHqW8SZrbK/wyuqlrcwZpY/Dbfh+/PY05MHff3AzT4IX9EUbml2uKY+blsYxGSoCtReHZBQvuvLK1lEMNmfWdPJuxuq9E2gB9ISyjsGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYwBgSFE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYwBgSFE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso5691055a91.1;
        Mon, 03 Feb 2025 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585526; x=1739190326; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mq07wVBt7GqzR4NZ1sXknFkx2PGTqOjqTr3fwMWvCo=;
        b=LYwBgSFE+iW1tOMddD3tDUJZG8c84+3cVvJYB6r/JdyDbm/4RXgZj+9vv728xCfo2A
         vFWE7CwsSUf2tid6BVSZiaZOmluQFpNyHeaGtcwRiS29vJ13AigY71839SwVW1e8NRLY
         QgW+RmrY3ZPlZDyLMRa/A/O9iJ+U+KhlYnAkpFmtm5tzUkU3/yc7qK5n1UZQWcCRwOVf
         DeSJsp2LSB0Ie8kZjXLaSmPH4L6NbkWr0vBV3yIpLftUJKdwuYvaDT2NIa79fPsBEIog
         KVGzZuP7Oqxw5XZ4ViDAIMhBJJUAJLCxR82GHGq2KFMPFY9gHcJm1L0MAZM/MCEZncW5
         YOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585526; x=1739190326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mq07wVBt7GqzR4NZ1sXknFkx2PGTqOjqTr3fwMWvCo=;
        b=I5Z7gYAJcmRMLNF6TNiWhiVQWQHUYYvkHmxrlcwT6ixgy0dC0FQAJbLPDVYOe/pHHk
         FCzF4vQShTuRCN6kv+xosL0k/PENRDuSsq+2gOmjflZoqqyv0DUeIxFpnVpBjklndSP8
         LD5HxJYwaXtZ1tVGAWzIUYHeL7fNfU5lP+1SBNgdyrLOtaWEdVvTBQ0b+Vky5s5H1E0t
         nRiDnlmo54vInWiom7tTY9RqjtxyDVP5/J2c+A0Bn6qqfrL9gFtRhGZ/kGcLEEp6/Cff
         RFB2/TohTPUKsGnUfHPvQt9wAeIRxaa3u0nk5V/sO1NlIk3kOhnf/rNmBee2FM9TMT65
         u7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWRI7oVy5qMDqA5hDkJkXu5cRKPoXftAqDCgQj9ohB6KcBDqZh1ONIZotYzx/0N4surHXw6oHzCw3Ur@vger.kernel.org, AJvYcCXk5TpHGzw/qrGFh+aofquwsh1x0h4XE6ojJ3w5ambFxJUQbaumYiVdYbtiHcorueh7TRWfADLD3fSG/Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBabofn0qAhOqFFnWaH0J5xoXjjj7NSXZLeziy+8sZ5EjV4ayk
	xsQWV96i0blSlDpPPgnpseJ6W1B9MY6KcUmDLOkJt6DIrYJc4g+o
X-Gm-Gg: ASbGncssc3Ip3AUoej3QPgOPX8bXtQyqxLFpyht6njCwLKeT1Lyr4Rsm/4ZGVHzXah5
	6Xj2T4j6QESQA+InK5rSAdPTWSjq6u4UhI1BCxME3MLURibh2pCgA00e/sYhGOSJ3vPtT6yQN8C
	3mGti6cEsFrGmIA3lj4WkH1uxUynl62G3T87qNfhnrtpuwRTDMPjtUjPsjQazkmqsvtO7us1zor
	0C1RU0p3PmsJMIu7WKXKNVorGN/m03umjO3Oo3d6yh6o+60LFWIBV3Q9bRdDZhJRqXI/G14JhOC
	Nn8SZMZMwXsu2w==
X-Google-Smtp-Source: AGHT+IHLWCUcWn5F+rrkIZfLYDGdPNjX/5KloKg1jJwtTzLo8KFaHpTxeyhVruBP98y2PyGB+rcWDw==
X-Received: by 2002:a05:6a00:1396:b0:72d:710d:611c with SMTP id d2e1a72fcca58-72fd0c7c142mr29936084b3a.20.1738585525985;
        Mon, 03 Feb 2025 04:25:25 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba322sm8256635b3a.110.2025.02.03.04.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:25:25 -0800 (PST)
Date: Mon, 3 Feb 2025 12:25:21 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203084224.GE3713119@black.fi.intel.com>

Hello.

On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > flow before transitioning from a Symmetric Link to an Asymmetric
> > Link, as specified in recent changes to the USB4 v2 specification.
> > 
> > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > published in September 2024, the rationale for this change is:
> > 
> >   "Since the default value of the Target Asymmetric Link might be
> >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> >   this field to make sure it matched the actual Negotiated Link Width,
> >   we’re removing the condition for a Disconnect in the Gen 4 Link
> >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> >   Recovery flow before doing Asymmetric Transitions."
> > 
> > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> 
> I did some minor modifications and applied to thunderbolt.git/next. Please
> let me know if I missed something.
> 

Looks great. Just one question:

In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
the link recovery status. Is that okay?

> I tested on Intel reference hardware as well but on those link recovery is
> already disabled so it pretty much does nothing. Below are the steps that I
> followed:
> 
> 1. Boot with "thunderbolt.asym_threshold=10000" so that the driver switches
>    links to asymmetric already upon first DP connect.
> 
> 2. Connect USB4 v2 hub.
> 3. Check link and PORT_CS_19:
> 
> # tblist -v
> Domain 0 Route 0: 8087:5781 Intel Barlow Host Router
>   Type: Router
>   UUID: c9680000...
>   Generation: USB4
>   NVM version: 56.81
> 
> Domain 0 Route 1: 8087:1234 Intel Barlow HUB Router
>   Type: Router
>   Speed (Rx/Tx): 80/80 Gb/s
>   Authorized: No
>   UUID: e9688780...
>   Generation: USB4
>   NVM version: 56.81
> 
> # tbdump -r 0 -a 1 -vv -N 1 PORT_CS_19
> 0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19     
>   [00:00]        0x0 Downstream Port Reset (DPR)
>   [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
>   [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
>   [03:03]        0x1 USB4 Port is Configured (PC)
>   [04:04]        0x0 USB4 Port is Inter-Domain (PID)
>   [16:16]        0x0 Enable Wake on Connect
>   [17:17]        0x0 Enable Wake on Disconnect
>   [18:18]        0x1 Enable Wake on USB4 Wake
>   [19:19]        0x0 Enable Wake on Inter-Domain
>   [24:24]        0x0 StartAsymmetricFlow
>   [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
>   [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)
> 
> # tbdump -r 1 -a 1 -vv -N 1 PORT_CS_19
> 0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19     
>   [00:00]        0x0 Downstream Port Reset (DPR)
>   [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
>   [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
>   [03:03]        0x1 USB4 Port is Configured (PC)
>   [04:04]        0x0 USB4 Port is Inter-Domain (PID)
>   [16:16]        0x0 Enable Wake on Connect
>   [17:17]        0x0 Enable Wake on Disconnect
>   [18:18]        0x1 Enable Wake on USB4 Wake
>   [19:19]        0x0 Enable Wake on Inter-Domain
>   [24:24]        0x0 StartAsymmetricFlow
>   [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
>   [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)
> 
> 3. Connect monitor to USB4 v2 hub.
> 4. Check link and PORT_CS_19.
> 
> # tblist -v
> Domain 0 Route 0: 8087:5781 Intel Barlow Host Router
>   Type: Router
>   UUID: c9680000...
>   Generation: USB4
>   NVM version: 56.81
> 
> Domain 0 Route 1: 8087:1234 Intel Barlow HUB Router
>   Type: Router
>   Speed (Rx/Tx): 120/40 Gb/s
>   Authorized: No
>   UUID: e9688780...
>   Generation: USB4
>   NVM version: 56.81
> 
> # tbdump -r 0 -a 1 -vv -N 1 PORT_CS_19
> 0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19
>   [00:00]        0x0 Downstream Port Reset (DPR)
>   [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
>   [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
>   [03:03]        0x1 USB4 Port is Configured (PC)
>   [04:04]        0x0 USB4 Port is Inter-Domain (PID)
>   [16:16]        0x0 Enable Wake on Connect
>   [17:17]        0x0 Enable Wake on Disconnect
>   [18:18]        0x1 Enable Wake on USB4 Wake
>   [19:19]        0x0 Enable Wake on Inter-Domain
>   [24:24]        0x0 StartAsymmetricFlow
>   [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
>   [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)
> 
> # tbdump -r 1 -a 1 -vv -N 1 PORT_CS_19
> 0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19
>   [00:00]        0x0 Downstream Port Reset (DPR)
>   [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
>   [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
>   [03:03]        0x1 USB4 Port is Configured (PC)
>   [04:04]        0x0 USB4 Port is Inter-Domain (PID)
>   [16:16]        0x0 Enable Wake on Connect
>   [17:17]        0x0 Enable Wake on Disconnect
>   [18:18]        0x1 Enable Wake on USB4 Wake
>   [19:19]        0x0 Enable Wake on Inter-Domain
>   [24:24]        0x0 StartAsymmetricFlow
>   [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
>   [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)
