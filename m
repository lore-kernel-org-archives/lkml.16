Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EE1B4257;
	Sun,  6 Jul 2025 04:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751776639; cv=none; b=YhNUT6KDwnbZXDPGeECPPNoNRZTUBq1CG2Ygyy5+NpyzwZW9piBRIXXpWqoKuRwatwg3ozd0KSBK52xcdTQvkWsYeufje/cBpCVBC5uHjiUFT4aLA85L9/rlJsS6+EKk5SwMUQqDynIiJy5MEPetPzZtLTL/nCP5ANB+qW5m21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751776639; c=relaxed/simple;
	bh=q6s5Ov3YkPc8DxSGBllfcY6nOWAeMlWy4GrMMNB9wiA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d50s3VAVl1T09cCvAiybmd/fdYEIFkLEsb+F6ij/CjCRj5Cq+FEGzrCRqOTlMMpOn0L4jfuXy56ovlMN2fK31R6genRG3WztMS6icvprJ5IEOvIfjsUvTVaQq+Hj4uz7oeg6kOXiqVyInXsctv8CrvjTcu3PqtAwHsMfcZYVFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAVXJfZE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAVXJfZE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b390d09e957so406341a12.1;
        Sat, 05 Jul 2025 21:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751776637; x=1752381437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1y2FRrOTA68hlJ+NjGl+jIRexDC9u6D/zy0MCfqEVY4=;
        b=LAVXJfZETvOTurqWX6rHFL8L+m+Jxwq8ZBqFnC/etC1CAM8Inm7jw4EDzG68Sdrphf
         LduwEc9pi5rqLzcRi4VwkkTHlAf12RHfgiHZjnPM5VM8N2nWC2JUMrLFnm+jHALEhSxP
         u0tCikUL7W4GxbRW4aa+RXBGv0HvBvgg9y7ij1sYcq52x3f0VVWBQ6IyIEtjJysoNvEO
         3Ldzn1DE4AF9uArcDW24uq26nnoa+X4BPYw3DfbXVk/7KH8p21QMoU45O70n8CKyKEyb
         vPKYsN0BBUE1ZnKtC470jHItEeFp8fD4jgeozcj6PAs3Fm3BycslGMxDQURoeQd81Dy0
         3weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751776637; x=1752381437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y2FRrOTA68hlJ+NjGl+jIRexDC9u6D/zy0MCfqEVY4=;
        b=HQ/FkuGQCbd9QsNKO+zJ9RB2RK4OasGq0lpOgAR2zxQupg0ITbnXcCyIl1SS3SNPWA
         giiAIYpSatpofeWpUdhxL+BllEaFkgltSR8qDSrNrAzO9si5BDuKkE4LrvUB8IoK3Kx1
         w3aa9mJnEi/8XyooeAXMjwTRg17CjwnOTir6K3uRXpeLOkBMwsxu0/YIDVWzj9FM4npA
         2GU3GIr5Htx/jwkbjTxJGIjQcs0o+ZWjcMCBfjP1qz+Qzve4/QLpvNgPZaPypIZX6mbh
         /GzJvYVR49Q6FL/+he4E4oXIhrBtyHR85hfRiRcoVTEOc05IpTWYA7VbRfTCsNiTvy8k
         PGWg==
X-Forwarded-Encrypted: i=1; AJvYcCUg68RQue2pnKvegESDl5g2zDg2gfj720+LSY4E/KJlrkNt8KdaA5SdIs8W2oF1Icrvx0YeNo91GKDWKph6@vger.kernel.org, AJvYcCVbJn6jFN5GPZxkxli5CwSfrbjbvIl9fuSC2VVrn3/GjK7syCq75kRRgRBplODl5/WDz/5ObBYM+Qdc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DxS2wIqt2KD9CPbdBPSh5R2szOYPhSmeHvYxyqSZkD4/i7CY
	xT0u4Glqu8dFMDei70fTijjKkX8xUatOJpYwFfU3C0osoObRX/JvHpsm
X-Gm-Gg: ASbGnctj8r3AhTrFpR9qB71jDhtxWs6gIMyMXWKa5UJShMXsGT4CMWcRAE3saD5eLd0
	/QokQHgoAbqv2vjemwJm+GYu7VwRIdCFSFs8ssVX6nzAkARfoo6uZSv+z7kLA+W4chphLfjcbnk
	wmLtarJU3GVxNzrUSkkWVD46EiyndXl+wQtaF/aBWqmzPw2urtqFTsuCnYmT3KJ3q5Ry5OXzCIM
	zFyFdY+76nw7N/KsQAO9yPytehYlh+M5hpgE98rzw0uY43udNnIbXeucHI8rJZ084JHXXipBUlF
	MhViN/Hn5KdAfrkqrq0kUNWCMkCDvF1MltrkjWs8MKGOxXWbTABwuB8g0bg2b83fLjEAz6Rybbd
	aihRZgEyzCo963iYvte+VxTGaUmUCYA6nV8RAe+4=
X-Google-Smtp-Source: AGHT+IG0ByxlfHWwgJ+AcNjU2yUsaqNnzgD75XgpxrmchkB3mZY7uDwPyNr4YJZ7aw0VrdPW/p4HBw==
X-Received: by 2002:a05:6a20:7f9e:b0:220:658:855 with SMTP id adf61e73a8af0-2260a69f74amr13517414637.13.1751776637206;
        Sat, 05 Jul 2025 21:37:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62b1acsm5577847a12.56.2025.07.05.21.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:37:16 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:37:14 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: aspeed: Add Meta Darwin dts
Message-ID: <aGn9erhghE0Bpgl9@localhost.localdomain>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>

On Sat, Jul 05, 2025 at 09:23:50PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series introduces the initial device tree for Meta/Facebook
> Darwin AST2600 BMC.
> 
> Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
> ast2600-facebook-netbmc-common.dtsi.
> 
> Patches #4, #5 and #6 introduces a new BMC flash layout to be used by
> wedge400 and fuji (and later more Meta Network BMC platforms).
> 
> Patch #7 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
> each BMC platform because eMMC was removed from future Meta Network BMC
> platforms.
> 
> Patches #8 and #9 adds Meta Darwin BMC and updates devicetree bindings.

Hi Krzysztof and Andrew,

I've fixed all the "checkpatch.pl --strict" warnings except the "new
file" warning, and I guess I can ignore the warning?

Regarding the dtb warnings, I've fixed the warnings from the individual
dts files, but there are still some warnings from aspeed-g6.dtsi. Are
these "known" warnings? Or is it because I'm using out-of-dated
dtschema (2025.6.1)? Please suggest.

Thank you very much for the review and feedback.


Cheers,

Tao
