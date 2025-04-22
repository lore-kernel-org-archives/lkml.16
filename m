Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A529B76B;
	Tue, 22 Apr 2025 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359853; cv=none; b=n14CZ94IRSlMxvPXXq9PBrCXLpSXIe3Kbhaif3wW7nwuwJtslNFhhyffMGw0yR2e3KIiG68tVRy6uStZpJpL3Fq/6y/B1cV4icHn/54Enh9nfJc54XoeCRiuq4WpCCIh/cP3ROeDOXVz1mFuzhHZ2Cj+zl55HWZXj1QNi7EsoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359853; c=relaxed/simple;
	bh=9PpIRaKCrDpaWSq2aJAOBOxwl7IqKqm4WOn5BgZwRQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AocdakQ29ggHmUgoE4y6tv673jFzHHOBsQoV6KGwuKj9FgX4+QMF0T+KIvkdlsYskjV3d3swQ/q3kmBtjVsOj7b0pfZeaO5EhciOflerkdQFe41ObACkyn1d6cFoxZOFsHYzdobPes2ohiuuBk9zhnBgKZOFg1FJ8g2isS0skM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2bswa4E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2bswa4E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso54888265e9.2;
        Tue, 22 Apr 2025 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745359850; x=1745964650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PpIRaKCrDpaWSq2aJAOBOxwl7IqKqm4WOn5BgZwRQ4=;
        b=a2bswa4EYzAjZPA8ZqVSu4Z/RqGGzgrkqHG+Y077evwJgLuYwdfJRoOop9ScPsWaoT
         dC42D8MSuLyraXWgf/o/Y7DwWuXiUzeMpX7lknbGIA72RiaYin0QufWZ9affuWz0wrgo
         hwOyrmVhcAPs/SyhDIJjwrknSs2v/VZQaO6/GNpqwT3U3IOgCcLzf7U09gSTnHPtd1gJ
         EOdeK43Rh99TsxGwtPDi+kKEEadFCCFlrdamJ0GhYN+Cip4LPHI6sUqVPl82M+ygppG2
         QyY3pcEB6DmX1iPtIV57w2DoqynFnJoqqPmFSarde+TFutDv9WRt5lQ4d3DuJZoLHYmP
         Rllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359850; x=1745964650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PpIRaKCrDpaWSq2aJAOBOxwl7IqKqm4WOn5BgZwRQ4=;
        b=qzGFsy2Zdd2275+1+txNU9KO51/ROGz2td6MhSdggIjGtG4peYI3Vk4gYQeKY127xZ
         KV5ou442PnjmIzQN3iOGj6RGXZ1aAwKyyPfqbcU/ly58o85Kz8g+2N6ZBrCPnHzx2IJF
         WmCh/kHbyO61EAWtBmK/Bn8hF1YwZMjSh9ysxjVvuCoyRFp1LE9FwCkScx7/zpKc9xZW
         v2v/ywXijAr7ha54fDrqDIIWcLD5kafb/M5JoOA7CpEU8rwrC7ZaSA6CzHG6X5gMSPvs
         Xb51ULGpZYM92j+OtIO6XIKS2aZuSSDEf3iUpoOCU7AQILtjly5TY8voLB5vQdyNKdAr
         IDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6UigvOF13x8Egzo7JqWRcoLDqGNnlzUWNX5Y993cEIHyawoosIeVBVBRITPp6o1z9Jh8bA0EjxScFbhoe@vger.kernel.org, AJvYcCW4LGyVjpHofgD8Xv4+tvIx3vB4mykh6JLysbOC8nJdQaGhTq8H68CekgzC8yuGWZhRfTVBIzKf87PtcDtCjyMfKjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5xstMZxlYCE+BTiDNDu4tfVNXjs2i43bzQNAGyuK11si/FuG
	AsZUv6Zr0hBVmeiQ0RseZFgjSH+Kh/nwZq6kSTOGsBrjVeoFqUO3
X-Gm-Gg: ASbGnctyG9hORDsWSAH+xJ5HAMJc9jgAkOqvaKKpRKOC6tEud8tzQE5oSnLdoKtV0ab
	6XEksiRChPBPiZYxPnjRjNI+iBoaAR6p0NreWWlmV09otR2kkwLKILiDZis5WDqkBdK70lQbCKQ
	NvpBL8VVngKfviXTEIhKP9XXBjUThxYjieNMQcA94B5fpfJyF2wTK+uLJlGCGZ9EQT1lxl3Oe8z
	2jf2/JdbhIrO9kFkwp4rtbpmrCgop42AwbL1hIe5YSAuFw2J+Zqt8jlvN10xi/Een224LeRIqmX
	/DMy/zUzIhzNGxQBqXmxYcv6E4o0F2pwOzHAs92Ma8gfJN7Mb73HTMK+Q9JT6HNHWxnKlJYA2FZ
	8Mi62bAyRX0siOoM3Ic3JFZFv/8Xj2A==
X-Google-Smtp-Source: AGHT+IGymzv3f61+oXSUU4r2sbQJiGRxAmUirwmBzCyWk6VzxeaT0fU6voMbGe5dXjuE2tpODFVPIg==
X-Received: by 2002:a05:6000:184c:b0:39e:cbcf:9dad with SMTP id ffacd0b85a97d-39efba50f42mr12476641f8f.20.1745359850009;
        Tue, 22 Apr 2025 15:10:50 -0700 (PDT)
Received: from nadav-asus.tail4fd44.ts.net (85.64.196.252.dynamic.barak-online.net. [85.64.196.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d1709esm3138325e9.7.2025.04.22.15.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:10:49 -0700 (PDT)
From: Nadav Tasher <tashernadav@gmail.com>
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org,
	linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: CVE-2025-22032: wifi: mt76: mt7921: fix kernel panic due to null pointer dereference
Date: Wed, 23 Apr 2025 01:10:47 +0300
Message-Id: <20250422221047.406011-1-tashernadav@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025041657-CVE-2025-22032-1c05@gregkh>
References: <2025041657-CVE-2025-22032-1c05@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I believe this issue also affects older versions of Linux,
as can be observed in the following GitHub issue:
https://github.com/openwrt/mt76/issues/966

Nadav
