Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872A25178A;
	Mon, 12 May 2025 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071509; cv=none; b=T5/sZto9D3QSbrNqT+Yjse/MSdn+6f/Y++d8F2JSZZGGidnA5yFy0kCSFWdMZAA7PaEVEhB/3FAY2jG6IvmAAQHjH1/BKiTEitI+9BNBnquSROTjswbgmZeaWA6n5765XMUBe7F+hUUNMv97u47wRt7gRBLRPzencrLWavlTkBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071509; c=relaxed/simple;
	bh=B4UItmh+eVsLgvCOj3orMp50Q1ZLsCdK5SSSrPRn+/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyclVCeQDv937qQz/VJ8otu8J+/lygdrchKzt4Zt/+n0PL643AE22erzJdmJ9EVyWjmv/ocTEAFw6vMim1KEecreV4o81SCoH82wqm221JoULg69M2lxJvu7oGad4Uzd0WJ1W6vFVl95LGkEyBgONogNm9ZihK+5nvzDPL32YdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJyN/XEf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJyN/XEf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e16234307so50451875ad.0;
        Mon, 12 May 2025 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747071507; x=1747676307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agBj1Oj+HZoy7ZieZW7PiYBsW88KoSoWswOv+iUWnyQ=;
        b=gJyN/XEfVoT0xjTXqrlQzLH9I6NQj86xPDgiA2MJd8GEtwLyD8oDmgyJhZdMywVGf4
         8nPyBX9mgxIeAO6Lx8hMfPFqeMXfnKirfuCPypH2Lg+iV0mjkzyw15YmLyNDgfYkDwRS
         02GuYpKuDD9q7CFdORwZ8LZ9BtgYPOZPNHUH/6Sc7rBXdTxw140KFHeC0wnaBfYLKhW2
         YdFAl4BVAS8i1TmCIyWDGiAFCDmEt3xLcPLajZIkV3sDLnrFtZ2nJMGQx5BMCnOsihD+
         GilropPLCCjWZoekk/YuVvltUvJ8Zkwt9JM/fUxzxKQzSyAA2wnn0ZITP7fo+SUZclbB
         w9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071507; x=1747676307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agBj1Oj+HZoy7ZieZW7PiYBsW88KoSoWswOv+iUWnyQ=;
        b=ZIooBxfavrmuCw0VqXZRi8GOcCcjvcTQuD/Cqouygxrz8r5pYA2Yyptm9X3/QDYzDe
         NNUKD+LS/pwe3ScpOJGoK3Gu8XjiPfE0njlqHcqAiI7C44/q+8kliaN18R0pFl9SHjtu
         DvwMex4VYM1mK/q/jyDxUDE8hdBfHrOw7wHxSMN2bTbcIMyuIp8bKK+dyPl6jjQWHuQ4
         r5h7wePN9s4+9J7UZnw8v6cS7jiopeixuPkUildzGZoBM39dlGdXJk+w/0ypdUeR7rBl
         CzDoExq3lLuvqf69Y0j+Sb/jI8wiROVXY2V2q3Cs3qre188v8CGV1t0arVMrpF4zxX1e
         HoEg==
X-Forwarded-Encrypted: i=1; AJvYcCVD3/iO0Cy62WRWn3OsCUiRHZ+2iOMMkvh8/cM9w2Ik6pxRCixwBVXp4h04SI4lVPL0uMJ/gJ3xO5Li@vger.kernel.org, AJvYcCVRqxD82vc/HxUqNqWH3wwLrZDxEDZ5/ROrlgojt9UGZ1ljE/5hiGwu4ZJigypI0KtqkgDIqhT7Qnrb@vger.kernel.org, AJvYcCW4w/OJgu1NKEg7+YWxBZQHBL3vk0KNk4ebzFKLhwv724xvkslBLynvD3eSGFm0UfBLfQth83ML3FM8vU5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FXqoJrgu7CNhI5jr6vghi0mFlHlZPD1nbF6Ndstjv3Fk/QPA
	BYKO2oaliIdNdxu+m5R9SxM0QSicrvVtS0OtVsNKFQBo+iSmBXxa
X-Gm-Gg: ASbGncsKXkAaFZsJtE0cwBVmlNOW1A79K6dyqw7SGNINI8xzU8tC3cbIdEM5NZiCrfy
	r7ihHNIFHa4KkZIEIIuGIh6tvG1sxqcz75QjOckHg799AMRGIL+ewnkr+dEPRB2rCaB4JHsrTs5
	bvbBIMbx7F4pscFSMuipASL9j4aEWHell7kF3G4SDvAS0673ila5T0Ekpr2XuMowDzzlLi6kBJn
	mF6GfWgMvgjSLe1SZ4EH0S7b9OlYBVe5EMM5FPDv2xMlNwvO+t+rQOeXTs8isg9Ar5+dj7RLkrm
	EqwESaiEalE6oPI3SVXRnm2EN4lmFDuDwd7ls1NfjyOYBg5dlpE8GfRe2enalCXO
X-Google-Smtp-Source: AGHT+IHQ7QSKHLeCHc3i6ANYoaeCnxFeiKS26unigu1BpiSeyWlgVDCMwVdGWqKDeoN5OkQN+yGMfg==
X-Received: by 2002:a17:903:1252:b0:22e:457d:3989 with SMTP id d9443c01a7336-2317c40892amr5417005ad.0.1747071506647;
        Mon, 12 May 2025 10:38:26 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc773e87csm65912945ad.64.2025.05.12.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:38:26 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: lee@kernel.org,
	geert@linux-m68k.org,
	pavel@ucw.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Tue, 13 May 2025 00:38:00 +0700
Message-Id: <20250512173800.6767-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aCGPuKtfprIvwADa@smile.fi.intel.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 12 May 2025 Andy Shevchenko wrote:

> On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > On Thu, 8 May 2025 Lee Jones wrote:
> > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:

...

> > I think setting PWM also same as brightness_set API. However, there are
> > many PWM config for a LED and it is one of other config to make autonomous mode work.
> > Therefore, standard led API can use in some use cases only.
> > 
> > Please see the link below for a better visualization of how to configure the LP5812.
> > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> 
> To me it sounds like you should start from the small steps, i.e. do not
> implement everything at once. And starting point of the 4 RGB LEDs sounds
> the best approach to me. Then, if needed, you can always move on with
> fancy features of this hardware on top of the existing code.

Thanks for the suggestion.
I understand your point and agree that starting with standard LED APIs is the preferred approach.

However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
It is easy for end user to investigate and use driver.

If I want to keep the current driver interface to meet this expectation, would it be acceptable
to move it to the misc subsystem to better support the hardware?

Best regards,
Nam Tran
