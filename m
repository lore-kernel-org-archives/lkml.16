Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2319D080
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329347; cv=none; b=HKwWr4mOJofRnDheumRwpxfPyXv+jCqiVMgPsVj7eK/MtH6CwxwOA4Wn/0kUujvyLvPDV19d5EFkZ1PwG6q1jZPmiKlEFhQbBt9A9NX8KyVx49MJ0i6pKZ3UdREnqCi3qzCG+2VPZomaCMWqg/m3+C/HpAPXuNeEyc6mTLaJJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329347; c=relaxed/simple;
	bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=IfNVT7V/RVKT9K+cdojXmXtyDBIqLBCV4RFCA69bS5n8Q29g2SOxh7QjmoU7rJCUUjz2uRiwzupkoxqrGej5KNexFty2QOBGEZup4dfXE9pYCnwldSDYkU3qIC+nmuvPkY+Ly1Hy0R4rEsDo+fUW46/HyISySBQhulv5k8mNuV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GkwJEvEi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GkwJEvEi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac73723b2d5so248632866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743329344; x=1743934144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
        b=GkwJEvEiwFaEAFAvbX7V4Fep1dcfbDO24sLhL05dnkkqb+hBbHHMKojTfQfencA+X6
         28bXhpGE2bZXJeGdhycTOKaWtsnWjN7b3WNHXXum2Vmuahww1icWBnFLSJQd8+Mtov98
         jxeCieH436mcZfXGw4IhPa7KweSSPO2VElGw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329344; x=1743934144;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
        b=h9UGvPKUQi/qsbN/Zc1DOzshIiwbSwendpSp0sm+Umu/9qTBVX+qS1JYkZ44tx+sjE
         t1jQdmWeo+M4CuZIfVzQNxGNi5qyIHoC1BJPv/1h/0BtTcMCceprKykP+jzl/x48JtgA
         5YPXqIilMMSKB5Bncqu88MWvzMFyqIS+MlPz2UPxLB7JZGEHDgEoGZnQRG8sQziYICIK
         LjcYqQPEo7iOslOz2IyJhBQEcJ+V5SGgBIZUrQMs9qfdROQBQZMk8SF1FyqfJ71ayzGz
         VEaaUtqOQCHYIU9e0fx9CpitunPYwHP074+WlLzSAB6mzKVAJDGpILGwntsPP+TrmrPG
         dUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOjbeUZaN1bDU7rTPdbk8LwLbms45e+gbXIiGF8BDNQucwHamV88z4N8KOBqteavySAz0tN3BHDzrrmbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypUb0AbZQeOzwTcNwKZpjtkxPRod46RgUTe4PO+GHqYsqEBjCf
	5sJdIYIkPBRYlnpIWNTqCAlemPV8oPV5xn7Tqe5T8XsqkUch/AE9WKY8tVcZMg==
X-Gm-Gg: ASbGncsCOuznWtS2Lj8eNf2d8iTL0+7wmELG1TsG6zoCLr5n9iwPHbRoqaG5yuowQuc
	nzAKpBF/KLVEpvL2kmaL/Bbmmj4Zvzjvj7CuuaRdcV4ugVucGqiSZ9paQ2mopL7V37uxppTIo5P
	ahqEBAR06dHmYxQYmAz34DbaltDIRJbvj9GkQ2zf36qPatoFQgCLuwVU6a38iP2csTuGXCzcQr9
	B6sDKYTwhbZSq8XC1/mNIRcesW9mSauhbDLO4rkSXAqH8Jj8XCK8IzVO98p/JUyuzt3xIYxKLsx
	26N0GdbYX+HjnkGlxqPhNXQrhlFEKc78bVtoNrQtnrGlOF+s8nT2vaq5KIq4dBAybDIIBtaLyyo
	I3zA4Zxtc+8le92mlaw==
X-Google-Smtp-Source: AGHT+IFJg4kUKiyT2B8lBy3TjPqrtF5fy65If7k3hF0Wr+PA0SEuX6wBhW6uPj6N1vgCiAhCTdyeDA==
X-Received: by 2002:a17:907:94c6:b0:ac2:c1e:dff0 with SMTP id a640c23a62f3a-ac7389edb44mr421471966b.19.1743329344359;
        Sun, 30 Mar 2025 03:09:04 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm450485666b.160.2025.03.30.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 03:09:03 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
CC: <kvalo@kernel.org>, <jeff.johnson@oss.qualcomm.com>, <toke@toke.dk>, <jacobe.zang@wesion.com>, <u.kleine-koenig@baylibre.com>, <megi@xff.cz>, <sebastian.reichel@collabora.com>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sun, 30 Mar 2025 12:09:03 +0200
Message-ID: <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250330093505.22370-1-abdun.nihaal@gmail.com>
References: <20250330093505.22370-1-abdun.nihaal@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] Fix memory leak in brcmf_get_module_param
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On March 30, 2025 11:35:41 AM Abdun Nihaal <abdun.nihaal@gmail.com> wrote:

> The memory allocated for settings is not freed when brcmf_of_probe
> fails. Fix that by freeing settings before returning in error path.
>
> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")

Good catch. Thanks for the fix.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)


