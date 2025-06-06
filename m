Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F31E412A;
	Fri,  6 Jun 2025 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749209435; cv=none; b=albAn1a0UhjbCqNkNk3s7CF1hpTqLZaNgAFNOrTNPn4lZDvHv60PV/aUP6Omu++qHf8YjkcrOhnQVtTaRsFR8nAJbFEI6w0EWy04jUJ3Oyj6aUTuNaNYQmGrKmfbbmV+qGxFFrZO2D8qHbnOtMzjDqFzOn4l28Op+w4oixlw/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749209435; c=relaxed/simple;
	bh=jmFalxl+IjOuauT3NekbWCs/KPsAGvLXHGBFChS7x1o=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CMljesR0tsSw/NuMM08PMGZV0zVlXCDFgVt/1lL40KRMpw3bPv9OLlk0Q72AiAiaoMKgdq5efjjac18u0htWdjhLQaKcfjMJa84x+LNjoeLyFJqPct+x6yUehVcfNYzMOYMjGdSSPccv2uVeprwLBIZ/2yUTU13iBnBGRa095tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR5M25zy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR5M25zy"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481adb0b90so75071b3a.1;
        Fri, 06 Jun 2025 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749209433; x=1749814233; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMRMKtR8HGzEv7gbQn+3NSkzgRpxdmG10HTMD5pS2Rg=;
        b=JR5M25zy67pM+lxKmulkzmTY7x7UGOhB/KfV0MyfZDAlXtEUwbxdSjS1rr5BgPKW5g
         Nkgtr7eYVOnTlUtVUzUfx3YF/JnxK15LQa6sKU2LvcyYwuSWPH8UClydaHkL0tMXBdat
         HITSwe52Zc9UatXShexgLpP8lTyHNNL6j6kKIX4Sn5dIY9vlvrcMK1UtgpQQ871mmGfh
         +S2/Q0XswabWLe/W8fcaCtukqwwGP8h2JqhK5SZhbpu7hG3/HNy1Di/p0mGjIUYXSbUq
         M2TVDGmDrG4aufAqON3Xop4LEsHDY2GrehlqTSr3Jo6QhLHPaYgBztxJIGRj0S7PLFUN
         i1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749209433; x=1749814233;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMRMKtR8HGzEv7gbQn+3NSkzgRpxdmG10HTMD5pS2Rg=;
        b=cOOM5Uthd8SnUxazDBtm/kDUP5Uw/wLzCfGGI7N/6naOPye3zk5IVjDQ2peGeRslbd
         Uv4zD1DqwQzCfTxHBeAOxmXHsXga48Rq7BRS/JGnG+Z2cK73mNMagVNjHde9P29zWM5U
         xHWl9DqPdVndU4bI21O07vfjMJ3T112UOcEGj1f4ZDWnSLaCWHJ4YRvIWJdzDC/OQ69q
         UxlVAWLDTnYk12oZKjEkq8QXRcdu2YAQaVBuL3ZVHrZHd1GUs1v3QSub2S4v7UJBZ3IV
         NVlLoFXd8sAdWTTNDjgg/3MUfKva9YfusM3c8idQQKI79NAQKK5qJ0KUi284QLGdyQs8
         88rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDFY9AyfQazRqVTgbryAew+LKv5yvgd1tADEztJ41snzru+BkYjYEEkw4WgKPZHqHvz1SjANFIz9HY1eg=@vger.kernel.org, AJvYcCXiBKPpRllnn8SP0lf0av3HBOA2Vw9xWDWn3ERB/F0K70yeRNn4XEkR0rTmUl7P2xF0eXzvWXuxYTy3@vger.kernel.org
X-Gm-Message-State: AOJu0YwBA9HSuybm+v6Yg93Kg+MCoPVjQhLmIHq8V/gUd6urMzTQexuk
	gKwhxS4GwAVLExsE4FNMm6lrv3k2SJGaHVmX+EpXakKbQ8cMJrNL6NU+mHMvmPI=
X-Gm-Gg: ASbGncupKtZJKduHYjxxfFoYAhJG29k3J27WJFbxiuo7iZN8q+AaDXwvyDDncgDpkGu
	pGjA2O4RHjpoRDSbetuoMgXSFjdrBk5C3101AlE3D1sbv3N5qJgK4UJBMMP2m+7h6UcDJX3QhaV
	Pl0phbZnQAaRkZyVN3liqzqRKRhvYDZtWDD+Ac5ZoI8DSkpRpqM0NNaE4zbFeIk2sb6xQxro9cH
	vCv//tf/ih1XYLmrdp/zAePqwVQP2YBcToUwQh9zO9parQQVfzfu5ARl6pF8b3ctI/V0wvYGcDO
	Jg5AhTMaPmhNp8WC+ndJ75rnAqfE0Hx6nOImxb/h+jl8/eQkUONcGuT45V6Z3Z2S1YHUivuftDN
	QDVKDTmNUTgdTzF3L
X-Google-Smtp-Source: AGHT+IEe775tc9IgVBaDFigw7nF+8klI4feYgHHUK8AIhyENn/tQSWUCLbyTAiy60D9ylimH2aEWmQ==
X-Received: by 2002:a05:6a00:4646:b0:725:f462:2ebb with SMTP id d2e1a72fcca58-7482d17eee6mr953176b3a.0.1749209432927;
        Fri, 06 Jun 2025 04:30:32 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:b5f1:3fae:6c04:a3e1:b0f3? ([2406:7400:56:b5f1:3fae:6c04:a3e1:b0f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482fc43a1esm720591b3a.38.2025.06.06.04.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:30:32 -0700 (PDT)
Message-ID: <6430992c-d50b-4cfd-bcb9-d7d376c53444@gmail.com>
Date: Fri, 6 Jun 2025 17:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: johan@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lestoppe@gmail.com
From: Amit <lestoppe@gmail.com>
Subject: [BUG] usb-serial-simple: device conflict with Owon VDS1022I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

     PATCH 6.1 082/167 adds serial support for OWON HDS200 through the 
simple usb serial driver (). This causes issues with Owon VDS1022. The 
VID and PID is the same for both devices so the the Linux kernel loads 
the serial driver, preventing the associated software from working.

     My current work around for this is to blacklist usb_serial_simple. 
Given that this driver change was recent and still under testing, could 
we find a solution for this that doesn't involve such hacks at my end.

     I  was able to root cause this issue only because the USB device 
and  software was working correctly before. A new user would just assume 
that the device is not Linux compatible.

     I've filed a bugzilla report here : 
https://bugzilla.kernel.org/show_bug.cgi?id=220193

     This is the software : https://github.com/florentbr/OWON-VDS1022

regards,

Amit

