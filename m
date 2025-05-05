Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AE4C6E;
	Mon,  5 May 2025 03:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417138; cv=none; b=Y+J8hh2mBTBISctOLhz2LlVgm/ZxTlPiws3g8u3sVCeqR58cmyMidvB+O4NqZuOTTGCXnvlC286ouckPNBCaBt1KWtkZlL+ZR03nKbOTwAsLwzxujXVEiJ4wqNj/opKqY+DzyM0pludC3PqiCUZAAAUoauYfeX1zjT0RzpLhLHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417138; c=relaxed/simple;
	bh=H/ONY6ifAPMFQTxbQ7D3jg5vYM3R0Z4G/HfHXfdPjkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhMkpLuvBMhkUov0YpQ0At/xQzqHoKwmjTGPKPMkRzd/rz3HGYKyui+TFjAxCoWX7mUQlUPsUCUbzCQa6k4+n88SeOKImtSi7f12Jb6T9Zv4mX9nv21ObHMQ/j3B5FVA4H7TCCmSR6tnxLGs39oRSD/ZB5rnNTNZf0ebXo+lPko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYL3e7+6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYL3e7+6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so3632849b3a.3;
        Sun, 04 May 2025 20:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746417136; x=1747021936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNvf7o4siGsURDG6n602O7SMh8Opj2zQBQp+iZEtUuM=;
        b=SYL3e7+65TzDRsIVOj93ZuW55LKB4VV71lo3hw9ThHmHUKCsotRQodIPrTlfZp4O/S
         8vzQqhxIfLILDd3/L57a/gHEvDsilWdw/flo69/reQ031rcqsca6A9nStzOtg4UxtXRD
         YpvOvY51Xp8hUt3gphegRqVA9vXc/U8cJKdokdhSanAdwx9P0FNHm8Mx2nLxPWmAt9eX
         TDUQEotsvtKIo4pki188Me74yalXk6KQAmdUdgkmVvkQfxshkksijbRpjp2l6Rs3+jvE
         NRKyB/+VPUBpgi7wyzgQf0aiSqgUPl1IDNTNfzTKl8lcarIs4hUP2MRA5dZIP0vTjICK
         18mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746417136; x=1747021936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNvf7o4siGsURDG6n602O7SMh8Opj2zQBQp+iZEtUuM=;
        b=NSSbBQgRBD5FcLr8TSTz5bw75xxqbpBDjMByH2MdBBPcOPMeaOV3yIHfLR8izCGkf7
         MFyjvdoTTmZ/ejq9XOxdJNG0n/RCtGwNvvAodghC8n8/0ej/1QWJ1RgjDZi7Ok8IAk9i
         G7v5m2r5H1V+qX9MqmJl09lB89Bdb3urMV/wA0bkHrFjjBkuhuHsXQVN3GilRO9Q3sNY
         CpEA+//ZhW+WYVOeh2onoFdb9FtuSmHJ94polzPBs6HJx4w6W57HNkVGKIgWzagYBaZD
         YX7Zmc3hm60kno/mAkvvkuCPZiSYDOdUogVYZvR3BYQikiHqzXMHCW1Mc687Sfu2eUSC
         1a+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+76LWCSAQIyWtUniXugpsBS8FD1LWxuWKdBjftUFGRVd1qBUKmZFMmhjawOt21TWLvxHTVrLhKTI=@vger.kernel.org, AJvYcCV7cWkhWc1ocXn26EGtpRAwlV19urnZONxBSo2QK1n7zXJa1Dxh01l5oCf9U8/wSAfPlTZESnW1B0Lg35OUT94=@vger.kernel.org, AJvYcCWO2tT0ce0of/XVZNzY02bEsadmZwGYuglsRBpye46R+irygbub2KDe4kW2j7WHbRfLMDs/6wtcna9hCGjg@vger.kernel.org
X-Gm-Message-State: AOJu0YwexmMeLIx2Pfjks8QeBvbTOCVBlgYn55vlmnpF905RjePMUoHd
	3VrqBLNf0DgBonmoNw6H9rwaRasPoj/gYm8GCV73RbXckkmN9Sdp
X-Gm-Gg: ASbGncuVe0E/iIFV8i8zw0NjYS+JHWGSWrUbkKdLrY7W+v8WOy2CwJyCD8L9xS+Dcfk
	3nwmGCRXe1TID5IeXbidsHYscxbLqCDf4XTfbNjmkIWLQ/+kp/fEG/Q0eQOt9wJ/BvYpyuDO8NY
	bbdXaFVFEmy1Q2/QYu71Uxbm33kBFqBom2byso63EZDWjZVqnEHOSU2zGV8lUGbD3c9s58OC9qM
	zWJnvy9opBnvr/38vpDnAofVNi/xWHHiLHSzbmsDRsVw/6vqVdEv2RUyx9BpdVMu6Z5SnMFhXoj
	ercodCN9/+i359jUh5F8zCE90ux/HZwNcQo0IosuLAe5Wv0eVtk=
X-Google-Smtp-Source: AGHT+IHlp7+ixVqiIJaH6+b7LqZIXj7uOxw3H0zvZbAcOeOpNbN3OyF77IbRRVRnaAblof6XOsJ4Dw==
X-Received: by 2002:a05:6a00:1c95:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-7406f17a6f9mr8201148b3a.16.1746417135510;
        Sun, 04 May 2025 20:52:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b5683esm4556306a12.24.2025.05.04.20.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 20:52:14 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BBD2E423CC6A; Mon, 05 May 2025 10:52:11 +0700 (WIB)
Date: Mon, 5 May 2025 10:52:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Shirish Baskaran <sbaskaran@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/7] nova-core: docs: Document fwsec operation and
 layout
Message-ID: <aBg163CasSBtciQH@archie.me>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-5-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OcuQ9cRkNODXY/5P"
Content-Disposition: inline
In-Reply-To: <20250503040802.1411285-5-joelagnelf@nvidia.com>


--OcuQ9cRkNODXY/5P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 12:07:56AM -0400, Joel Fernandes wrote:
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +FWSEC (Firmware Security)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Separate SPDX line from title heading.

> +Here is a block diagram of the FWSEC memory layout::

Add blank line before actual diagram below.

> + =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> + =E2=94=82                         FWSEC ROM image (type 0xE0)          =
 =E2=94=82
> + =E2=94=82                                                              =
 =E2=94=82
> + =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90                          =E2=94=82
> + =E2=94=82  =E2=94=82     PMU Falcon Ucode Table      =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82     (PmuLookupTable)            =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Table Header            =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - version: 0x01         =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - header_size: 6        =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - entry_size: 6         =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - entry_count: N        =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - desc_version:3(unused)=E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82         ...                     =E2=94=82         =
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Entry for FWSEC (0x85)  =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 (PmuLookupTableEntry)   =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - app_id: 0x85 (FWSEC)  =E2=94=82 =E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90                     =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - target_id: 0x01 (PMU) =E2=94=82    =
=E2=94=82    =E2=94=82                     =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - data: offset =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90 look up FWSEC   =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82    =E2=94=82   =
=E2=94=82 application.    =E2=94=82
> + =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82   =E2=94=82                 =E2=
=94=82
> + =E2=94=82                                         =E2=94=82   =E2=94=82=
                 =E2=94=82
> + =E2=94=82                                         =E2=94=82   =E2=94=82=
                 =E2=94=82
> + =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82   =E2=94=82                 =E2=
=94=82
> + =E2=94=82  =E2=94=82     FWSEC Ucode Component       =E2=94=82<=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82                 =E2=94=82
> + =E2=94=82  =E2=94=82     (aka Falcon data)           =E2=94=82        =
=E2=94=82                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82        =E2=94=82=
                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 FalconUCodeDescV3       =E2=94=82<=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98                 =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - hdr                   =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - stored_size           =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - pkc_data_offset       =E2=94=82    =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - interface_offset =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_phys_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_load_size        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - imem_virt_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - dmem_phys_base        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - dmem_load_size        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - engine_id_mask        =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - ucode_id              =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - signature_count       =E2=94=82    =
=E2=94=82    look up sig =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - signature_versions --------------+   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82     =E2=94=82   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82         (no gap)                =E2=94=82     =E2=
=94=82          =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82     =E2=94=82   =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Signatures Section      =E2=94=82<=E2=
=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98          =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 (384 bytes per sig)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - RSA-3K Signature 1    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 - RSA-3K Signature 2    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82   ...                   =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82                                 =E2=94=82         =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 IMEM Section (Code)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 Contains instruction    =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 code etc.               =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82                                 =E2=94=82         =
       =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=82                =
=E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 DMEM Section (Data)     =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                =E2=94=82         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82                =E2=94=82         =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Application         =E2=94=82=
 =E2=94=82<=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98         =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Interface Table     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 (FalconAppifHdrV1)  =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Header:             =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - version: 0x01     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - header_size: 4    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - entry_size: 8     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - entry_count: N    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82                     =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Entries:            =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 DEVINIT (ID 1)  =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - id: 0x01      =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - dmemOffset X =E2=
=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =E2=
=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 DMEMMAPPER(ID 4)=E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - id: 0x04      =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82 Used only for DevInit    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82  (NVFW_FALCON_  =E2=
=94=82 =E2=94=82 =E2=94=82    =E2=94=82 application (not FWSEC)  =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82   APPIF_ID_DMEMMAPP=
ER)   =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=82 - dmemOffset Y =E2=
=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=
                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =E2=
=94=82 =E2=94=82    =E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 DEVINIT Engine      =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=82 Used =
by FWSEC      =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Interface           =E2=94=82=
 =E2=94=82    =E2=94=82     =E2=94=82         app.       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82     =E2=94=82                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82     =E2=94=82                    =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 DMEM Mapper (ID 4)  =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80+=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98                    =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 (FalconAppifDmemmapperV3)  =
=E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - signature: "DMAP" =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - version: 0x0003   =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Size: 64 bytes    =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_in_buffer_off =E2=94=82=
 =E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90             =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_in_buffer_size=E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82             =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_out_buffer_off=E2=94=82=
 =E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_out_buffer_sz =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - init_cmd          =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - features          =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - cmd_mask0/1       =E2=94=82=
 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=
=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82            =E2=94=82     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82            =E2=94=82     =E2=94=
=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Command Input Buffer=E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=98     =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Command data      =E2=94=82=
 =E2=94=82    =E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Arguments         =E2=94=82=
 =E2=94=82    =E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82                  =E2=94=82       =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82                         =E2=94=82    =
=E2=94=82                  =E2=94=82       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90 =E2=94=82    =E2=94=82                  =E2=94=82       =
=E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Command Output      =E2=94=82=
<=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98       =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 Buffer              =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Results           =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=82 - Status            =E2=94=82=
 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=82 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=98 =E2=94=82    =E2=94=82                          =E2=94=82
> + =E2=94=82  =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98    =E2=94=82                 =
         =E2=94=82
> + =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98                          =E2=94=82
> + =E2=94=82                                                              =
 =E2=94=82
> + =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

The diagram can look messy on certain fonts in htmldocs output. Please
use ASCII dash (-) and vertical bar (|) instead of Unicode box decoration
variant (=E2=94=80 and =E2=94=82).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--OcuQ9cRkNODXY/5P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBg15wAKCRD2uYlJVVFO
o3d7AQDBVc1UI56/zh/MRT97O5/Ouu8QFG4mQHoCYh1roksF/gD/bgBTjzNGqC74
vVabcuOUUWD/nP9uTMx4g1EuDI98xQ0=
=LjZE
-----END PGP SIGNATURE-----

--OcuQ9cRkNODXY/5P--
