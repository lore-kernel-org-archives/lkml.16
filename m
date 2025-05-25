Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A27427468
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159028; cv=none; b=EKeNSaxwya4JDM1sCRODaxfH+CFpa6+3gUDI/wCXNi0C2wDMBMkqNZm52KXXnJiCmbaj3Y7vfbm9JUsnTph2CGlNkeucuXhVMrNOv8Y6aQNuyzOjbpxZDU6tZMi2l39HZX79yl4R1SOrKUIUx7zo50uDFgx94IF1mMBIVAUnX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159028; c=relaxed/simple;
	bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBuZLOjk5FZ+EDmJ+4Oi6aIFRUk4f54OS6jLwDAgjmR7J2jKbzz8WwZUpQ5Dree9zQdC3FP8N0nzrYP0/CvipcRnMpZ+Pd/vCEgu7+n8DjL+KCyjfysPexA0Tm2WOw53HV86zHOUk0tF7JxkxkQZXK6cPx9Ib8PipFFk4YvZYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDdMDM9i; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDdMDM9i"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so2533533e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748159023; x=1748763823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
        b=NDdMDM9isDMhp9Iv343cdC2oUpJ3mOIO/53mul2WISZdLY9cVVMWZt5dmMJy07cVre
         UV8KCHicdIB5LlKNjxC2XyjepVT4FFaqLNKD8sjKfGNUZ6RkOV+kJINN/yuHaJp8JTjN
         Omary/DSZqdbwP9JZgNzYMEhL78EdFtyn7uFPWNDQB822tzyi5qRWRwPD0ake08F1TR+
         TvFR1povcszZCqpZ2xeLtRFIOGmTvaYCZWaltrqRmU4X1rjELNrcIdUqGDGCyUF2Yz8G
         D89ekKc2YaHw65uTZwFzxGVS9eZmYWfbeD3ZWVl6I888BksZMqxbzFjf3zLTeh+kp8Bv
         03xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748159023; x=1748763823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
        b=TtIcpRoEG5uahMMFumrxekJavWfYHFIOL65mXNkpyLW+d9dt+IZa+h4GQPesnA0dXb
         RFgJJ/dzufM3mh6lOXVIRIsIpW7zO6iaCTvtpYDUhlIcODZg2tMqCuIR909WoDnEzF2f
         x5xocH5HFTGFX/AmsGyYR+wbUob/8B4boB+QmIeX/KXoQEM1Zp4dUcuAV1eQa3e6Eg8m
         uRW8I8i6ojexWTjCE1jTxoY0Y+7SNNoQqVrLQ7E+3dgtG1F9MDPt+nWW5qSG7Hmfix//
         2DrUkiQ2dUVmvpnQ8Ajbk2wgV82QGeEEZoLzhFLXoU8SHngUlpGtvNrilteLXzjAS2Ax
         PeLw==
X-Gm-Message-State: AOJu0YxRsFtNvCc8Th1RBy2q0yov1K95Jw35cX1JE4uEthfgQNWxcHXW
	0DOcH9t7v5K9jj6l8YaE5OE3DxOw6SVPDcUw8CpXNqTXR2CgLO02fHXqG9pwpXKZ7ujhW5xwOXL
	CTHmSwCr2BKqO2PjuCI8Tdd5e2dHXhms=
X-Gm-Gg: ASbGncuR2NrrFPtuuJMXQTC4P9VkJJ2t1HXRKGnJ9f5WA4oKfPTvEMc9DK+qwtEDEJW
	wIeS9lEYfAPO/HB4C9aHWI8SI3RH1xHrDju82SspJNwlY3O1Goqb9eYtmlk7Q+3DHzX1pp2f/C+
	yUBdJtsr8xPINxoNtkypu0zvtlO+Y69y4w/my0GTLb3ne2
X-Google-Smtp-Source: AGHT+IElg2AVSjGDoeSw1Ci2kpsxjpSyIF+GFQfHZT4Pp5AcgRgc3koVP0SyBIIwmqk/QcbC2C+irny38xN1UQaYtBQ=
X-Received: by 2002:a05:6512:3d12:b0:550:e648:182a with SMTP id
 2adb3069b0e04-5521cbb5a15mr1052666e87.55.1748159023035; Sun, 25 May 2025
 00:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com> <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
In-Reply-To: <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Sun, 25 May 2025 15:43:31 +0800
X-Gm-Features: AX0GCFvFuIsDLxFAIWFAyC1uBnkKKItwFZ-YL8uHxsx_BIRszkxMhYAOvVGQb0Y
Message-ID: <CADHxFxR9+r2358KZgax4G8ZBUB=w1R=HysvjxE7ahF2ueQCLXA@mail.gmail.com>
Subject: Re: [RESEND RFC V2 1/1] sched: Skip redundant operations for proxy
 tasks needing return migration
To: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"

Hi John,
It seems this email might have been overlooked. I am resending it to
bring it back to your attention and continue the discussion.

Looking forward to your response!
hupu
