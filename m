Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1801288CC;
	Tue,  8 Apr 2025 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080606; cv=none; b=D9NU7SD+ANqwg919O+axTnz48bd6ikiOopjNh0p5EmPgSLkVzem+eQEPk83XVvO1uuFVdod10nIA0NPfk6uptguf2Oq8j4S4OBp0bg1EE52+efh1gAPT+Qx3raSu4L6jG4I+ssYS0LCgb4H5NdSgl5iOFW1ByMdm55EzCqVgO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080606; c=relaxed/simple;
	bh=Cth6DEzU1Lvdb8MsfD7VRg/uZ2/8DWvACgqcGwYJqcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3yYQPMBwY4CtUNJUsEfpz+4x976JazWoapeTHLe2Dii8HwfZ3/Y60UJzBD0t6tpU6CUOtuBBUrjL/2fRnYWGTPovaoGW1mH5VjAZCSIAOWS+TrORbzNfh3YRTOzh5GpzquWO+1USxWtmLQaS9YDTW/MhfgEQigKTMrtrgGcLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwVoAonN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwVoAonN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so4818809b3a.1;
        Mon, 07 Apr 2025 19:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080604; x=1744685404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cth6DEzU1Lvdb8MsfD7VRg/uZ2/8DWvACgqcGwYJqcw=;
        b=QwVoAonNG7ydmRGUiYeqnJIvp29AWleIAnXWsDCgxB/uGhOVBYB3DQztenncDXVH+m
         95YL7OhDSIvVZhOtr8A4J1Dtyv4CzVt6nacEKvGRNMBG6B5ozo2ufwioKfZKYxVkLEDh
         snxA3cx0lpu0tr9KDc88hCJyl49boZ4sk5fGJztd7NRqA4lOqig70z/xPMvXQShLOKuA
         3+bJrVBculVRmZC9EbHXU49RJB1vJzEFchyj6JMnUq+9/SGClTo09OmsZ0p2ox1srr2L
         8qlpcU8/qPq7FFo/nPySAP5jbUpswFtu3GzkCbzkEzLJZI79GAg+nOld4q5yvDvDx+Xe
         KpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080604; x=1744685404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cth6DEzU1Lvdb8MsfD7VRg/uZ2/8DWvACgqcGwYJqcw=;
        b=SY7zSTKr61NI9+aE8Qd6/sYQXo2za8KI6Of+seO8U7R5oWDPs1+6GLCMUdcosSWZG+
         uTHMAcnTKyFie2p56cSFQh/X+NarsnywFd/2ulcYLT3BQWLT29Z8GayNcdJknFZvZ3YF
         +MSNr0EFfuGrMeaQtwbohaxkbOBheC3PJ4S15J82iw1L2qrXN/gXAkG3lkRM/OwEfq2W
         i0Yr7Ge6PDcFFjIp1ucDpCmhUceuP9kfxT/7jHB03pwOjfAaTqzb5EmPuekJtw9sn51R
         ZrZLAw6x93KPc2vjJMCoitjFuo11vqr+TLEVC6gjFOgKpt3FI6V6qNX5fMdKElkHa7zA
         K6eA==
X-Forwarded-Encrypted: i=1; AJvYcCUMoVs+nM9DeD+5b8FuqD0VG9+XtAl1BddOD0hSKyA0RGoN58+Ze4WLbOrW/6MnVtg1zMr5hYNw13M=@vger.kernel.org, AJvYcCUXGgT1NWfzV7gbZ3VSrv5oDOycKSp4rCV0v3/KFka77+3VfVBUb+k1TWklpanpNOpkQonyOqwDg0v2BiCCMAyWDK6Row==@vger.kernel.org, AJvYcCXhTptESZ4Vu4+7bBwRB07e7/DgPL4Wb5iHwqqdLe3UAcO+84HwRsQoIcIQjrtdsHw4smAIrV3yf4wHyOFW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzedviien23t/sW4X3vKncpraKPcWlTa8RT1zSsHQ9U3UkMYH4E
	q5nUqWaoVu+YW37uHz8d187WkAW1Sac6qpYLPzwdBvUZrq5oTJLx
X-Gm-Gg: ASbGnct5ByKh7puBXnVTQKazq3nWUglsk5aG0SZrewOoh+fZ4O7qy0e1eH+KzZpVvAE
	hN0SKQ3vWycJuW4w4uyvnUvJrMQ+l6v1gcem1Fs7OEvVSF4UpVmNS76RSJueXbVdzhpUD91hooC
	w9lyRfw4a6hjPBN6KS3vFVstPyyLU1QjEY464Gd0MeCEH4InNvrmknkdft5hZgbw82JmY3U+Hsu
	JS5GiR6bNDbVGTFXO2kQOS+jw0BJ2D4LNgYOAMWVMn9KWKbS5bQB5S2SDN3nrZ+70thmPC0FnrK
	p8cwYwPG0YPQWFszXjaiTkswvBDO18+p9whAArcTlnrJxxkWwpS6elc=
X-Google-Smtp-Source: AGHT+IGK5tUXHAlmfULfhwp1g4yLp0i/9elCRhY3So2bgspe0qrtj9S4q7rbiEKjVFgicIz8ng8r4A==
X-Received: by 2002:a05:6a21:8cc6:b0:1fd:f46c:fb42 with SMTP id adf61e73a8af0-201047339c6mr28279180637.31.1744080603933;
        Mon, 07 Apr 2025 19:50:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9c62739a8sm7231602a12.64.2025.04.07.19.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:50:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9A9A9420A696; Tue, 08 Apr 2025 09:50:00 +0700 (WIB)
Date: Tue, 8 Apr 2025 09:50:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
Message-ID: <Z_SO2AkhedcuHeOe@archie.me>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HZiyhvZc60l0G0IJ"
Content-Disposition: inline
In-Reply-To: <20250408012815.1032357-2-derekjohn.clark@gmail.com>


--HZiyhvZc60l0G0IJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 06:28:10PM -0700, Derek J. Clark wrote:
> +Balanced-Performance
> +~~~~~~~~~~~~~~~~~~~~
> +Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
> +enabled in their BIOS. For these devices, the performance platform profi=
le
> +will correspond to the BIOS Extreme Mode, while the balanced-performance
> +platform profile will correspond to the BIOS Performance mode. For legacy
> +devices, the performance platform profile will correspond with the BIOS
> +Performance mode. For some newer devices the "Extreme Mode" profile is
> +incomplete in the BIOS and setting it will cause undefined behavior. A
> +BIOS bug quirk table is provided to ensure these devices cannot set
> +"Extreme Mode" from the driver.
s/will correspond/corresponds to/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HZiyhvZc60l0G0IJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/SO2AAKCRD2uYlJVVFO
o59yAP9Su2TBW33AvsAIPJ1o6NJs5L2hZcTeVxtxQXxyvkRmVwEAkMvgXYDZ9Qsz
cWnog2KyZKoSej6dBqln6RS7bBEWTw8=
=KunM
-----END PGP SIGNATURE-----

--HZiyhvZc60l0G0IJ--
