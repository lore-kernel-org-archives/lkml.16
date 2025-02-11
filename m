Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382DE253B40
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288994; cv=none; b=QMg4KmiEvcOou8CrnhoFqH1p89wdP9mDFnsfVXoAPJX8PanWCuzNhweu/hEsglcNDhEu/MsrfBKCMWtXhfx6IGcvepm4FXy+zbQyiIdWQ7MHtLFOYumL6586sFEWjs/Mq1W8tv9VTz5xlxTQ0z4mYFpWkpVmehy794EUG3tZ4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288994; c=relaxed/simple;
	bh=tc3Z3/vbj8eaWV8ZARulWo6HcMBAleEI1od5m8b0CPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqqniTXYP4W5YGhHhkLIxbZ05+sw8Dy6vVp/OnRVNybFvwfrDVddBZuQMOsmcgpqjwOpeIecttIL3DCHJCUxsgPSMjmsoKku0fPvR5NjDtZnPNqYlQV9BDOh7HTWE22/Htnimi0wbhR35nPsNbf7ZN7QAzYlEPR0QqXm28KfzA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hCdMtx8/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hCdMtx8/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab771575040so1102232866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739288990; x=1739893790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVwmbIN53ZZEzhu3yBtqTvWwAukU5JKJpM5GyqpzQFs=;
        b=hCdMtx8/JxLtYhL5jqw78sXwEhpjU4BTSuWyWbo1ZOY4VuF/TOQPk4378y+LwqNcCH
         F+xi1MoRXLrC1CFlleqwy5mEgBYtzXt3xlHKN76K5BTcnnMP8VckNLvk0eDEYtJsxHja
         7CZjjo/uFI229SCNQwaiH/NOv6sPJZxCQjzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288990; x=1739893790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVwmbIN53ZZEzhu3yBtqTvWwAukU5JKJpM5GyqpzQFs=;
        b=G9mZ7Wlg6JexpktD64FeojESehVEHB23QR/Z7CZuWIt+exXvp3HDbAeELiS1My2Pay
         JN8G5hpVFCTR5Z9jtqU6lTE3CfGCg8uIDohspKO3eOfer6ODTP6LDXhrQQIaWgyrXhe3
         eZDErCg/gw9So4kS+bvs/Q7uEEFgXDFwZoNhW9sBqzmBZpTCW1P0dMUtdHjUa+tTUMhb
         4prH1a0oh/t3KpC8ZexfMbC8lTww6gTNJedzhNneRXJ8wLYC6/LnWnOwzmrHZ/j/04X8
         3m/ivUxp7/ctLwjXx5MZm9p/LzHBHZZtjH1xM+kmYRlCmOd39Xyqxipw6We61wMDezvM
         SFsg==
X-Forwarded-Encrypted: i=1; AJvYcCWVY5C1UwQChAnHAGU0Vezb1HOPBhchuP5OMzPaozGxNquNO4SaT2bcYQ2kkphbEpJReZ4uyxWPHJPD01o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5bg+LOVeoOfInrp0AJwSpcb/JHOlQEKrpIs3YKLzL7o15GUVd
	iCakJFA9UB0ztfony1ELnwJBhfj1tSVa+zmMgFDOB/a7Lz5tZ47bWxHiBlyl0o8WtTd/R4gEZLX
	zCd4=
X-Gm-Gg: ASbGnctwabuAyZLqdz15T+WRoRWDdP8lCr5DKvtpWlxHxZ1BPFuzNycE2tposeF5hHq
	O4K+TFq3OAPSrbFucbbpTOBd+P7qaZshpTgN+yobtUxodUbtfHMeJCcwPSUfAxk/WRCwZ0plaPa
	sGG1aKz0tCHMCyxZ+nnMAU3fayzPJU0x2Gk/54NiptgOfL7ILu9k+l5662BDtVluX9UTkxMYY6G
	S6A4SRuoCLRHbVHE/VXDVE5qKCq40iieatpktA5tWlhzHVbqr13AHcKjJ5WGxQvIbbWTHUhfqIe
	DFlyr57ZU89+M1dZvNlL6Q2VZisVlClYnvZ4CWYM+k2BFMV4LDNAisIznu+KRLJNYw==
X-Google-Smtp-Source: AGHT+IFkgbYeWBfkCy2MutUv5incDhnp7v+FZPCq3zG7TpSioG1KTf5XzpUx4DWKSfgBUb09qUJkWQ==
X-Received: by 2002:a17:907:2d8a:b0:ab7:cf7c:f9ed with SMTP id a640c23a62f3a-ab7db5a5addmr282556766b.24.1739288990227;
        Tue, 11 Feb 2025 07:49:50 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cae13326sm336247466b.115.2025.02.11.07.49.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:49:49 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5de6069ceb5so5587574a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaHknLW12YmDOYS3G2uMD4Kc5Eg0WUYTYMXdWM6IqagB7z3XEWnuntEy5NVLn+CAIqbgngdpeCxRBUg2o=@vger.kernel.org
X-Received: by 2002:a17:907:1c29:b0:ab7:bd8c:3501 with SMTP id
 a640c23a62f3a-ab7db35bf15mr395283466b.18.1739288988462; Tue, 11 Feb 2025
 07:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz> <20250211141109.GV1868108@google.com>
In-Reply-To: <20250211141109.GV1868108@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Feb 2025 07:49:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
X-Gm-Features: AWEUYZka3wAIe19x0kez_tFXsKssoOVt4xO6i6B_lPdVBwJWqORTVQnRSfmH0iE
Message-ID: <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 06:11, Lee Jones <lee@kernel.org> wrote:
>
> I'm struggling to apply this.

Well, it turns out I already applied it as commit 511121a48bbd
("MAINTAINERS: Move Pavel to kernel.org address"), so no worries.

        Linus
