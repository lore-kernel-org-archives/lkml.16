Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60D245014
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636311; cv=none; b=btRbIVYjXIftkknXT621hgpDh1jlZuTpJkCdZxmQHh+9XLKSqm6mf03RJNDXyzRH425qfzeuFS21tO97nudg9XWdfC8+uJaHLiU8g8er6BAHhJf81+gAKuLaaS+z9IOK/khmPQ8af0+ts36L5QwMgfLUSWFil8chg1xX1lH/qXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636311; c=relaxed/simple;
	bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ6US8dDqKaDB8CZUGryfHh0BbGayVTi47pd4bTeSfCPUWKccKjYb6wRMSNfn1/wJ8bettWUfPhtirHoUT64SEejrcn2BSZ8cGwcsoGHhBNXga669a72QXAjuUmUs3bH9wjSBw0RnRsG6cD+b/3RjOab5PaBbhsCDQ/oD8zGmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiEBHYHq; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiEBHYHq"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-601470b6e93so5225597a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747636308; x=1748241108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
        b=HiEBHYHqf0fd/1kNwvdyg83/LlvIFn8na3R/Ifbr3cvkVRajB3C2h3qNHkqtpRtLUU
         XrmoKEZeJUWGZ08dPEFSl2VYfIDJyrq6F2CaGf1S/kOEPF/9st2pLqtPzdziVR17ov5l
         iQJIhn4AkwJ7VmhZPjFgSKHkilLIe/1rf2hP7NZUL7ELRs+wJrzvEGKpdKZeM4umZFnd
         dsJ5bGPmLetT1WLVFDCLCvDIOQ8Gei2wOzg0mb4790sqNZW2vL0/aWKUqLY1azyZVu7i
         QzXntN4rvtg25Ef3a18baG10CGCkPzoFcJEwUgFuvbnTPP8W4rT2kCfblZG2yVJuEo85
         HBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636308; x=1748241108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BF1ovdxwQHWY/86acyml+Ji0aewU5uxZv17FrAdL/Nc=;
        b=QCASpCQbjMy4noH6v+VWhy7xFlXzhqrd0mQSwb30OE0O/cThXmwYwxsOOifvZcqNWa
         U/nC4nUg/5lSNJ33gzq9fR9ERMOys7tR/JpsrhsvMr7xe6c3ufT5PcqtLD2ap0vcYyt8
         E9bk/WoOMOC8K4yuEXSwQ2jzkji1FemtgwBQafLis1K0JzhrrpujuCtnCHgwP9p55UB3
         Kr4sxNnh3Hde/7aCR1EDRJmKpaPgTdeUydgYZx8i2zcLqgZgP4wyWYezxlSnMgFZ/GgQ
         rFJOgqRJfgbZwfoEQzaypay5erc2KJmzC5v98xi+16WyluD5wL115SVoIEfbl4QVR+ao
         EqKg==
X-Forwarded-Encrypted: i=1; AJvYcCWafk8fx7YUjqp8p/Bpiwx0qq6USBPHvwh0Vl3WkCWcY0zb947rMvhNoQNUOXd/10gJkeFgSMuueuQFWyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/l3Pfa5eW+KkhM/ZsRlZDXY+h05P+lXdOObIVYgaVMh/ZLRC
	Leh9dh0qiPZepz+EJsLR+I2Qp/M22fxaXogGWL5ziR35vwKldUWcgJHIcozWoUhSK8JA/MLiLlD
	BqKQvBOMbru4ZVZyv4XY9bx45pcmDHCCFyZnF
X-Gm-Gg: ASbGncs1VupRrwYaU7KZpjvNcP7oUgWYlYu3e3b+sLFg+0T0T/fs5zKV3l9HWM3I4zJ
	2hITg0qAJWa/xc87R+a6Q8ysxyQoBtOjfN6ELxBdxouLjl/x8/uYXs2vQXLTQWZeqgxwTewiHrZ
	pESP2Qzx71GH1+U5vQ83jvtbu0S0V0ZhfDhQ==
X-Google-Smtp-Source: AGHT+IESRmn4RqUdcN4tMhYxA674kvZ/4Qlv/882CQtNwGmSIHeKn97znZffKYPCylyJNOLV+K7PjG8R0OFPcC/Fixc=
X-Received: by 2002:a05:6402:348b:b0:601:834a:e678 with SMTP id
 4fb4d7f45d1cf-601834ae764mr8593090a12.17.1747636307474; Sun, 18 May 2025
 23:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518225035.227880-1-siddarthsgml@gmail.com>
In-Reply-To: <20250518225035.227880-1-siddarthsgml@gmail.com>
From: Siddarth Gundu <siddarthsgml@gmail.com>
Date: Mon, 19 May 2025 12:01:36 +0530
X-Gm-Features: AX0GCFuZmeAJjIjy_nJmuf4nTuZgAv1N47LqwJBiIudfRuPaPnH59k5gJVtM8Nw
Message-ID: <CAKWSiC6tYijmMtnmhRrq8OTivfRGu6D0y9vWbPd0g45x3yoA=w@mail.gmail.com>
Subject: Re: [PATCH v2] rbd: replace strcpy() with strscpy()
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	elder@ieee.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:20=E2=80=AFAM Siddarth Gundu <siddarthsgml@gmail.=
com> wrote:
>
> strcpy() is deprecated; use strscpy() instead.
>
> Both the destination and source buffer are of fixed length
> so strscpy with 2-arguments is used.
>
> Introduce a typedef for cookie array to improve code clarity.
>
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

Truly sorry for sending this to the wrong mailing list, apologies.
Please Ignore this. Sorry for my mistake.
