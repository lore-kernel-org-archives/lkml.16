Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CB23E355
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303807; cv=none; b=N+Dmi70NRHdd8G01YXyEp5H6VxPW04XgBG55cQKTvt1o8ZYroLGJKnufLEWdTFQWUb3ZB3O4i4e7N/4km8qtmJ2RlngU4XTH7K8ps1XvVS9eX6RZ7bJLFbSft8LV9d99bF0n2fTTPCDZsE91gUhPCXf8RzNL35vRh6mkNmf8tpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303807; c=relaxed/simple;
	bh=WCWk66zyPfZePbjJ8LwbQT1gioDez3btZNmAk+8q5YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2OuRaIg3CfOCxLpiA7kI+s8vyrtTRFdC6xTgv7RGdDpx0cLB2bD1UoBGMC7/gc5kcAMMKJXg3vngHPULI/xsdR84Ahr+nwaNGRc2RZbUm6uzwx0i/w/xO72K40/xhPE+o5yPa6BzVRR+spi7awamWztrJT3s2r9rPnGuaJmviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=PZwxacJ5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="PZwxacJ5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34914825e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1745303803; x=1745908603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCWk66zyPfZePbjJ8LwbQT1gioDez3btZNmAk+8q5YY=;
        b=PZwxacJ5MZb0Vhj9xW1OFX4VMuLbjR/JOCIuELUpcLyNbTRC5LD3BMF5VvNElKicnl
         UJTXHXuTDz9sUlTVk8smDVYKEEXz2lYAg4u6UUApx5A1knR/AL6+T26zs6oeh8ylq96Q
         K2uMpGFuS8aP5NRyu+s6XK5izUGJO0rxFXpfBchyr9ZuLF9gUJZL/O+rXfJrfXaayygK
         pwwZ9ZgjiffzF8f19gjGdKyEpkYbHjLEljntGU6ktHawughbWexiuWQy5mjxwofHHSQl
         QxuR8KD3/KWctHypDVRnwR+n3dq/43MC75Ow/1XffVKse9h4mQOQfHDdDhVoxL2MY9bW
         fP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303803; x=1745908603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCWk66zyPfZePbjJ8LwbQT1gioDez3btZNmAk+8q5YY=;
        b=lSg8CWEfr3yP+Q1kdIKCEzJn9OqBjLDutSM3kkalRGoxXQYvHMjKzgyalQsKyGLQ3Y
         kauE45zdplstg9VBDB3jLOeM/Zz5QsJ6m8ejGuABoFRfJr5GyaEkbfMZcft+85L8bNVG
         WPVRMdwqR7aVgE50s1WGdAbtk90agn+vE3W6lcdUeyw9lbqCp7sBhf0VzxscAPurR7y9
         2SJJpJuTxXGkxQK0CBmMfkx4wUWZ91GuxDB+u1dmMQn7tmdziMT5eSAT2kmYZ5W69DxX
         wHw9hx8qYD54vM8D6BElZc5oEbEZCi7QAnOR5dxvo4zDME6MV3iZ12jn9m8q9K3bIaId
         Nmlg==
X-Gm-Message-State: AOJu0YzVhvlQG7WwcwkuN4XPeNNK3LuKgbTBUnmY//qGGgdxpK1l+EjI
	YPW4cLtHWygmF5EBwzB3w4tFuYPuHbxix04iV/pAUEowK3dWoOTEZEG93WwxTAQ=
X-Gm-Gg: ASbGnctOremHyWDrJ2C0Elt+tSqTjbCtP6unmBqAaWzD/euSjllorAtEwbAGX0qLkY2
	k+oeYRrIEUx6F/BGXYmKhZTIOWDHWuED5xa8sSFVLY4hlE3jviFp1wj7hP54eApDSkKfSK1TN89
	Uq73FmSDZTzxhfee8g78aqbmmZlMgsFqW9wsRML16bi9h7QQXebW4hnIodL6Cl0OuQvhd+sS03N
	bCmiiUjzKQhf9VyeT1BiaZe+f9/2chCdOfVcxB76vXsrsPcoZZDey/3ZFQY1cqO3C0848Jom8as
	h3neCRjMkZrPaSK+ybXltst1Lcbs9Jmwtt5k89Sv0Q==
X-Google-Smtp-Source: AGHT+IEcHXvi1Hm9/zAzhzfBnLuE8US8c0mBQ4Je3kxYL/vJ45G9HxCxXacQl/ww64L67Xp+jjmUFA==
X-Received: by 2002:a5d:47ab:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-39efba3cac9mr11006036f8f.18.1745303802675;
        Mon, 21 Apr 2025 23:36:42 -0700 (PDT)
Received: from somecomputer ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4930f1sm14253954f8f.61.2025.04.21.23.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:36:42 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Richard Weinberger <richard@nod.at>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 upstream@sigma-star.at
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "leitao@debian.org" <leitao@debian.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "sagi@grimberg.me" <sagi@grimberg.me>, "hch@lst.de" <hch@lst.de>,
 "upstream+nvme@sigma-star.at" <upstream+nvme@sigma-star.at>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>
Subject: Re: [PATCH 2/2] nvmet: Restrict in-band config files to root
Date: Tue, 22 Apr 2025 08:36:41 +0200
Message-ID: <29921235.1r3eYUQgxm@anvil>
In-Reply-To: <cb7dc726-f12b-4cd7-a121-aebc9c510771@nvidia.com>
References:
 <20250420104726.2963750-1-richard@nod.at>
 <20250420104726.2963750-2-richard@nod.at>
 <cb7dc726-f12b-4cd7-a121-aebc9c510771@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Dienstag, 22. April 2025 08:32 'Chaitanya Kulkarni' via upstream wrote:
> Patch looks good to me, can we do something like this and
> use in the rest of the patch ?
>=20
> #define NVMET_CFGFS_ATTR_DEF_PERM (S_IRUSR | S_IWUSR)
>=20
> or
>=20
> Create a helper on the top of CONFIGFS_ATTR_PERM to wrap
> permission into that for all the CONFIGFS_ATTR_PERM()

Sounds like you want to restrict read access to all nvmet configfs
files? My focus was only on files that contain secrets.
Applying this to all files increases the risk of breaking existing
userspace tooling.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


