Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C6253F1B;
	Wed,  9 Apr 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191741; cv=none; b=Fli/KdVKTK0Pqf2k76aNmX51qUhOz9GBYLhsOPJP8dQdSGWvlo5feSkuR1BB7yAPIueQqCfEuW9z0Uq4iCYFvxxESwfihdmW6NSlWnP7Mzy4I0B83+3KP2wwIST48vSVvd2YmX5MTYRULCRXRnJE7TJkVpZ2u2AQRA0tlzxVJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191741; c=relaxed/simple;
	bh=+xIm5QaTkd6wUvuWwFpOoa9gHwHT+MTsJAnhcqKhick=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxFgYaWTiX2QrOsr4EnGStsmByI+fDZhQdxLLCPVIckBXLepAjwCeI6+KLwkoPxNC071XNqydlwY760VGpqcu4362J7CCZSAK28XnP0qa6Pjvnl+pQxXJvC1qnLFfjxCMWv9ucqFie1sNK2neAAKb1QocN1CDNXy6quD359Bpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1qvPjAn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1qvPjAn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548430564d9so7314181e87.2;
        Wed, 09 Apr 2025 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744191736; x=1744796536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rukcpxvbwuYB2l7K8gJhZiG0D7KlbxMB1KIdtvrzhM=;
        b=N1qvPjAn+03SlAIRcbJjcbO7tawpXb9II/WQtB0i5mQBuu8NmpwpEIxEQEYucgft2i
         +AeswfPoikJh/Ju5OinOUpDvmVTBxhSAvrpQHA323SVORu2Qp4e0eqP2XKR6RJJQi8FI
         jjFQUrDVD8rsksIJzevPMhEKMlC85HEUYMQrLcY/r+0lmq9YM1EKp61glMTEsizsysYv
         vJ8wvrTN7oq70FMjba0Dew+7FHdy3FSwHdDPr6Wim8zaS9aeUrj8Ju7/OCwXxjMNBCr/
         rtKSMckMuppAFD2+bptU3d3SW9LIvJ9qZ7LotXCnnxJzFdz96ooMpa5mIAo9u+5ABF1C
         uI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191736; x=1744796536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rukcpxvbwuYB2l7K8gJhZiG0D7KlbxMB1KIdtvrzhM=;
        b=ANWdeKkbI8AyESfPU3PpqQI31DNU3NyA9qtW61gH+uuJiQ/ksEEvp3PDZA8w5psqWN
         AsK6/qpCD/MAFPFOa86NxwjBEv4D6qRhQv44nlvP7LOIeXMpNIFUF5IAhpG98+wGQrK9
         RzEvrfAyaBE69GiSV3UYIqRt1l7Www46Y7YAZs14uDIk+e+MmMpPxRBWOsIYXebXyhnR
         KfgvKFrzufZyzr2KfyQ/sK8QEBt1ld78CEzjuf+5OBbBJFioDB01g4g/9fbx8b7FoqUH
         QVlTdUERyegaSCMwo/E7fqJygWynNad8FYKecOokjoguP0pkYsOfmi8iI/Kk0EPVsWRw
         RQLg==
X-Forwarded-Encrypted: i=1; AJvYcCWlNydZ0MtR/KhEPRVtE3HPjNFc9FcthOzpCibmgJ6t5EUYpKMjYDqzdXVOCa638jEDzzUdwS9elp9g@vger.kernel.org, AJvYcCX9sPQ+STlJM4Qd5aDZ7ZYy725eZe3qwpmrz6slNyUv/tL4MR9miTDXkcigsCYplNbHejSTCyQ+rQITRg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsi2BlntOey1pAIMRVA81fgPOq4Mxlbd2OI4JXQtlA8ywymcA9
	b0GXDb/lNobc9X4lWV0tCipPvOwtsswbrFLuQZOX3QB17BIXGIb1
X-Gm-Gg: ASbGncuxtDhBkW/zqvsfJqFgkQdLQ9fwaZbkwGydzAzoQRrA4lNHet5rm/Wep5RaTJ/
	2TpoJ7kOmLw2esk6B72I6+w9nwpwj459M32Bx3OMwv6yTpDm7RWAmKsCegfLGlezUOf2OQ0QtxY
	b9pP7MaUOkAMirb1L2Y+1Omo4GJbaI4a4UgHHRxc3DgHvXf3ATb5Dt3H4DZgIaOE5NPUXnM/d3M
	hV2j4iNDGuxzA6jvcC7wsFKfXY43ZIs34lXQ+2cQ9gjsMDyRn5dRVdF5GsaWtvGWy/Hx5+c2sgT
	VbDn+qeRzBxeBEpap3s+8qhwFtNnsz/n9is2HLvyoRnX8E9bb/yQL+BjbA==
X-Google-Smtp-Source: AGHT+IFDE7FB5vAL6zbHiHf0loRdqp6bETdh6LbcKxtoIUwcaRLI3ATBqkpfKIyYT8rnNRgmNE09Fw==
X-Received: by 2002:a05:6512:3ba5:b0:545:17d:f96b with SMTP id 2adb3069b0e04-54c4370b196mr557305e87.14.1744191735938;
        Wed, 09 Apr 2025 02:42:15 -0700 (PDT)
Received: from foxbook (adtq195.neoplus.adsl.tpnet.pl. [79.185.228.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c455d6aa5sm91559e87.35.2025.04.09.02.42.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Apr 2025 02:42:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:42:11 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Kuangyi Chiang <ki.chiang65@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix invalid pointer dereference in Etron
 workaround
Message-ID: <20250409114211.62dddbdc@foxbook>
In-Reply-To: <20250317222927.5b76518e@foxbook>
References: <20250317222927.5b76518e@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mathias,

Gentle reminder about a pretty annoying bug, it would seem like a good
idea to have it fixed in 6.15-rc2.

Basically, if you use SS control transfers on Etron, this happens:

[88483.258966] xhci_hcd 0000:06:00.0: last TRB on seg we're gonna dieee!!!
[88483.260825] BUG: unable to handle page fault for address: ffffc9000177a00c
[88483.262441] #PF: supervisor read access in kernel mode
[88483.263889] #PF: error_code(0x0000) - not-present page
[88483.265306] PGD 100000067 P4D 100000067 PUD 100234067 PMD 103dd4067 PTE 0
[88483.266648] Oops: Oops: 0000 [#1] SMP
[88483.267980] CPU: 2 UID: 1000 PID: 20753 Comm: v4l2-ctl Not tainted 6.15.0-rc1 #7 PREEMPT 
[88483.269327] Hardware name: HP HP EliteDesk 705 G3 MT/8265, BIOS P06 Ver. 02.45 07/16/2024
[88483.270689] RIP: 0010:xhci_queue_ctrl_tx+0xaf/0x410 [xhci_hcd]


On Mon, 17 Mar 2025 22:29:27 +0100, Michal Pecio wrote:
> This check is performed before prepare_transfer() and prepare_ring(),
> so enqueue can already point at the final link TRB of a segment. And
> indeed it will, some 0.4% of times this code is called.
> 
> Then enqueue + 1 is an invalid pointer. It will crash the kernel right
> away or load some junk which may look like a link TRB and cause the
> real link TRB to be replaced with a NOOP. This wouldn't end well.
> 
> Use a functionally equivalent test which doesn't dereference the
> pointer and always gives correct result.
> 
> Something has crashed my machine twice in recent days while playing
> with an Etron HC, and a control transfer stress test ran for
> confirmation has just crashed it again. The same test passes with
> this patch applied.
> 
> Fixes: 5e1c67abc930 ("xhci: Fix control transfer error on Etron xHCI
> host") Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Regards,
Michal
