Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F32566FA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198782; cv=none; b=Yd6kQskIizAkQ18AYhrgZ/NnSgN8uXeT98xEoSDY/vXfln2Lpl/8Q/Il/X72avJc/TDCtCFC1Q1wxonUfv8JjGNHFnx7dugNf08UUYmifvajQNtJ72hklZiOVXmQA8oBpA97YKB/WRuVryNbFnoVRyRAw4XMBdPlcdEoyCcoAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198782; c=relaxed/simple;
	bh=kHJpIvhRm5qEuCVbTAMGfSvPzJM6QDKFgb+D8QDKxq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfe6g2+mlu9V9mPX09STy5R2MH4wiw5QbibEjFS5amxc7T8Oeu+2EpCCgYPaXPh3DqIi76aO6LRASg2vEenjDkSEo//meEQlRG2QIV5IiMmGFY4RsNNxEMlDlUXvCitrJHqH3S9R95JbymrmtxqkXsGDilWDa6TA2H7R6PPtxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=DHKPyrkk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="DHKPyrkk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso3301855a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746198778; x=1746803578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHJpIvhRm5qEuCVbTAMGfSvPzJM6QDKFgb+D8QDKxq4=;
        b=DHKPyrkk+1qGBL1zEOFsWk1juTqUZHnEhfizMkwZZNk030zH73VIcGvqNHSHKNWw0E
         rSCtLEbFVwzCGxHBOdR4slGclXOhYBrZHj0tHLR/UgbufXoW0xp96/AlB3z5Onm58aO4
         vGlQK3tVZAe2x78C/oB/xA6My+Udnpe9BeGMjjMXlQMw7V2liRngCAsN/6HXdQ0fX9SB
         ci3X6Z76i+JdYyLeLEoTYw/AbS+IChP+Ui5K9ZmmiG40vnnElnUpJyZl2nheTIgwhEk6
         ynS8hQKRGLDG2MxN05kptSsFHRdMrOkLsagJtnGIywbJ+CYxYZAVSkykp52jg7ZHOymO
         hddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198778; x=1746803578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHJpIvhRm5qEuCVbTAMGfSvPzJM6QDKFgb+D8QDKxq4=;
        b=e/pbliLgc42xqJ9bRpqPA2WAJe9lKkLbcQZpfpbfH1rHpiU/fgqJA5tVnCoWCaSss8
         obw8rtcmegqr7ybZnNXQlN6TYAaCtcMNF0vsE++KC+USHar0ONT0Rgbjbg2LL+yRg8Rm
         MlvPFLlxqQHbEJls2CVivFpVhYdR2cnbg96lA8eTMtZWrRLZaisbsaDZAqgbXr1peeiH
         lE6ErJhw4A2v3wiFM0AlbRH54IgPu0Pr1MQcWKxdAmKdSCbg24j8ckxuprGN8AfxwxMn
         v8waBc1XWPkSBHxxghKl4rnCDWVY/m4+QUTfNOpVAzUuw201SwSd5uLJOOecGN+suzOr
         eMJg==
X-Forwarded-Encrypted: i=1; AJvYcCXK9ibRyttaAyTLB4cM/sOdT3lAUkD0kxGe5H/PKo1UuyIKpBUdCo2YVo3TMoygA0pDWhUMYQf3dAWvRkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39a/PVOnoAehxH5GVZgBPm0byFEUAlHmrdiN/7ey5CrNXZNbR
	/1Qz5WMJGasT4YL6XeG/OjbnqfR7UV6L6LgcrUWF+YFFHT7ZerOqnRRdhiSRYb9vHKSKG6WoQnR
	9rZ+mSGJK/g2XaCG/EZUwDJURsOW4heIi5xah+2PuAQKH/njg
X-Gm-Gg: ASbGnct80CzTHkeB6VJvjPvO1Hc/M4HFwvMIpsXPwOLYewGgLf9KAouYIv4evbou5iW
	mjFyl4EIOoVwwiWqUeeMtD9vSkr3ji+vk7FDghA89NiWu8W7OpJm+PAef03lqr/DlnZ1n/rhlDk
	czaVHrowv8gImqsRLXWnJcOUSTjNwid86Cd1lQPfyToMFM2JwuMMQ=
X-Google-Smtp-Source: AGHT+IH10dat862J8/hfkVJq5kzyiUxXwBhazqVPkNV47H+1QBPSZtq+KvDAV/qMH/8/qbkxuOSNr88fuE3fS6O2lI0=
X-Received: by 2002:a17:906:f5aa:b0:ace:6bfb:372a with SMTP id
 a640c23a62f3a-ad17afbc749mr342319366b.54.1746198778257; Fri, 02 May 2025
 08:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502103905.3995477-1-max.kellermann@ionos.com> <CAD=FV=Udm8M2HnMWzzY-cyr7UCVf-0O8uSe-yOAfJ+27YBOTdQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Udm8M2HnMWzzY-cyr7UCVf-0O8uSe-yOAfJ+27YBOTdQ@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 2 May 2025 17:12:46 +0200
X-Gm-Features: ATxdqUH6Hj1BDF3scZBnMGsZSo_ODZ4g6D1H_zc6oESgPOpdSCiUMKiYUs7NxtI
Message-ID: <CAKPOu+9-O7kfV4-qMLF0bDCzYc7O4AEB5Edf_4ehGd02CvHN=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
To: Doug Anderson <dianders@chromium.org>
Cc: akpm@linux-foundation.org, song@kernel.org, joel.granados@kernel.org, 
	cminyard@mvista.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:40=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
> Hmmm. I suspect this has more to do with the fact that both hard and
> soft lockups nearly always end up being fatal. ...but I guess
> technically they could be recovered from and the kernel can be
> configured not to panic, so I guess it would be OK to add something
> like this.

This isn't really about recovering from such a lockup but about
detecting it easily+quickly with monitoring tools. A machine that had
a soft lockup still works (for some definition of "works"), and you
cannot detect this condition without parsing dmesg.

softlockup_panic is a bigger hammer with pros and cons of its own.

> It feels like there would be a better place for these to go than
> straight in `/sys/kernel`, though I don't really know it. Maybe
> someone else on this thread has opinions? Any chance they could go in
> "debugfs"?

"oops_count" and "warn_count" in the same directory is prior art.
 I don't think this belongs in debugfs, as debugfs is not considered a
stable ABI, and this feature really isn't about debugging but about
measuring server health.

> Please no embedded ifdefs like this. I personally wouldn't hate it if
> the "unsigned int" was simply always defined, but if we want to keep
> it only defined for sysfs then please use a function to increment this
> that's declared as a static inline noop in the case that sysfs is off.

That would just move the ifdef somewhere else with more code lines,
for something as trivial as incrementing an integer. It's a question
of taste, and I'll follow whatever coding style the maintainers
prefer.
