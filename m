Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8D101FF
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746362028; cv=none; b=KE+ykEhhO90o1Wlm1C8/n0rUaAnv537rz4fIEXbd857a97LTOZAH4cuhBlHP+jP+IVghFO52ymmsfWnnKC0BBO26MKUfDXNfhxLm28D7WoyCE7djDUjhUsyeEiff6X/cToq+sggm5HG3iMfOQMJWTtaeUIT5R1Bt9wZTD7e2Iog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746362028; c=relaxed/simple;
	bh=4B32Fm0s/baIe83VPoBaFsa/QIb0HD6mhWP70gTNV7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfpoiYCaZYusx0TVGwgR5ahzLnK0lrCTI+wm7jVYNz8EjmAvGPxwGq8nBXRPNGW945Tt+ANGSMjbv5JVWQgb/lsf60epEDQ0UYsOiGC2rk9FykSPaUdx/6vrC24YfQyWzmvf9fJNJwDs888+LRDQclg/XcBb4kp1scUWcBbjA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=X9p/SyRu; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="X9p/SyRu"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b07d607dc83so2887941a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1746362026; x=1746966826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOSXI/OcKrzZUeNPNP0m7qowONkz227CA7/4JNyGcmg=;
        b=X9p/SyRukQg/y615xWBWZtZh++KDBF4pyhuVPFjmyoBNw5eYBSeUIku9C+H3UNmJpv
         vA9WwzhY9No3wbhuj0Ou/ZZCEQG55GfIL7qNRlktI6rUV+b3KpkvDxGZpBF5XfEhtgyO
         gWm1WiWEzfLJag3HmzMfNhk0Tjt4mVNQ7Wt9bT4O2eIxReGW+j9n2pNOiVG++WGYdw39
         fDaDBBkd5ewGtqh5cceZPkxGILydP4absqJYxgCa8h0KOC/Q0n5DeQJtFDZWLJfXRwX2
         ejtCDeRWYZYfBmqJXCeNwW50i26X4JTlVu/z7Uh7B6KguK23/MvPl2rXjQ0FqSM3yT9y
         z2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746362026; x=1746966826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOSXI/OcKrzZUeNPNP0m7qowONkz227CA7/4JNyGcmg=;
        b=iQFc+sJbeYvm8K6/Spog03gs6UPFvMk82pfxFH25FkkCQNs3/75u33LyGgNQDgeeRN
         jh2sgyK7NRMlL7ksApv6CHd3kzfdNsnKEFi2/hxT8UvXIQ85LA/OMbG/P6NIGfhPMmW+
         m3I3bTdunEl0Kyw1txZl0v48L9/8YUjIeDqNsExWl9Y7YJMEKvVA23pAdWbEplo3hH9s
         k83cl0YCuR5/O8nD3ATRQTg0nN3kbsIastYO6yks6YJIExq2yIe8DCsSy4QRzFajX2Zf
         AokMrsFjlaOewlySS2AJpI07zg246fK7kahIX/qcst++4g6j00qYLivWPfd+e1p7aSuq
         R5yg==
X-Forwarded-Encrypted: i=1; AJvYcCXTa41/pt8dCDWAHe8j+kpSeIWFmua0n827Cxx2rf9QqsTvmQGx07xn2m+YUgZ0S8RucVzfGWgc8LZqYqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylG2O3WZ4IBiqoWxVUehEu3CJPCo9+Vn6x3IOKVJc7OcB4cV3l
	dUHOjpF+G1y8l/A0KcBO/QGjiXNBU1jVqBdG3biu6LZaA4DgVmfbpMWJo2sgEQ==
X-Gm-Gg: ASbGnctDJ9Uf0vBZ9CsTl/h6YdWcAJQCe3Ge4h//+H40LpyId8i86ftX9H38aky2Xq6
	5dyfRXyEs7g2L+jnt2vmG056+0Cg4cWaYzttpqDzXGdFYRnleE7mfGdWu2UybZMcQNKckyS7Jiw
	6nWeYPEBb7+4p+f96QKP7DFWd8n0uNleULqH729UrVOzcP7RrmOiPoi1Ce1nWG95FYkqihpGMkx
	GaAvCtRQyZW7QabZvGlb2idpLj7sMpIwo8zxXtGMsujmy/MjU4hQ36ZnsYPBtwOcpdsrTWhrA5x
	KvoX9QqS8uD6D/RBlRv+dI5J/5aHfukympnqXMYyRYCchAI=
X-Google-Smtp-Source: AGHT+IHq2YVjfYe0OyALgfaePEq9mmaA1jwTUEbvkKFySNnqgRFOichVPYS8KUrysr+L3G5suaVRUA==
X-Received: by 2002:a17:902:daca:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22e1ea7844cmr53010185ad.42.1746362025593;
        Sun, 04 May 2025 05:33:45 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f915sm6677721a91.9.2025.05.04.05.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 05:33:45 -0700 (PDT)
Message-ID: <e05c315d-a907-45f0-8f5c-1c106b05f548@beagleboard.org>
Date: Sun, 4 May 2025 18:03:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Herve Codina <herve.codina@bootlin.com>
Cc: xypron.glpk@gmx.de, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <20250430160944.7740d5e9@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250430160944.7740d5e9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> It depends on the bus the device is added.
> when an overlay is applied by the kernel, OF_RECONFIG_* events are
> triggered. Some buses handle them:
>
> 	$ git grep OF_RECONFIG_CHANGE
> 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
> 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMOVE on device going from enabled to
> 	drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_ADD on device going from disabled to
> 	drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
> 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
> 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
> 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
> 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
> 	include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
> 	include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,


Well, if some bus does handle the event, I guess it is a bug in the 
subsystems that do not? Maybe Greg Kroah-Hartman can clarify the 
expected behavior here? Maybe we are in transition phase here.


Also I guess, feel free to suggest anyone else I should add to this 
discussion thread. I want everyone to come to an understanding regarding 
the fundamental behavior. I have been getting mixed signals in the 
various discussions I have had till now.


Ayush Singh

