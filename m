Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C723958C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809607; cv=none; b=AFf7ESt1oJBbYa4QJOttNB+2ZfCrDWIQKswN+jGa6n6u+l7Dd2ahgtTxnlrvWENBE63RQm04+8cL6OvuWQGiuqoQd8iZmBI/98YvjDkVFiQxihKsIVHEOkfb1GHQbTRk1vbavnFgyUWKkCAra1Wasj8rXYZu3t1AVr2G2txL1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809607; c=relaxed/simple;
	bh=ovsCpdfdcv5lWd54vzHlEPAEE72CBV3NXgYXZCNXoKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4VDKaDYWNzH/MN1wH8Cfguvqf0KI/iMWw15/Qiy8c2jSg4MyVkd+yw+8I/FXDNiS3VuetVO1wNfzZ9yqWDim3CnL80XJGXuWYTibfLaVYPufBs6O/ZUI2yQ/XcZ0lF4nnHFvkr+Rl4cs0XyEqMZ+9sNy4ypUaHCvkVFL01r7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fMnjNRxO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fMnjNRxO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad21a5466f6so210556466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746809603; x=1747414403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvftcXXxC+RA38DZ97cxLVbR/d27myTWn86O+uHVzlc=;
        b=fMnjNRxONLDW6QhnV+6UgAOQW8cqEqG+hyzp0G42OxJIIr5AZmti94+nefIRUttvEB
         QqoVofvDQA571rT23L+zHlA43bkDu0fYLC51hbUXZhi6jVtyfqRNVOVEpVOm3yqmMPwg
         iU7WkbybwgU+/J1rlcrD/CPhm2n42NakZudaREId+2p7WCXvarUn24EGvsDqh8B+zNCj
         w1dYbCXLw4TN1SD6DBFBmacnWSh5e7euIJoVQjEEfevtyx5oGljcswFStoNTLB5ZBV3L
         HTC62P0Z002Oj79e4nxjvhwJvS5NgSq2ubXGfymFag0Lgw7m/GkK4968GSHx/B+auAU5
         A6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746809603; x=1747414403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvftcXXxC+RA38DZ97cxLVbR/d27myTWn86O+uHVzlc=;
        b=b0bvNDh6U9HO1jXe+vkxMK11q5KDkJu9j+kEOAf2NdG+y+0eytG5LJ9Ldx5JCC4LNd
         lIULwYGRBaZYAHuKdveTho7u5WO3giRZyTMJbTHT6WXPcJebcF57qIjprEa7Hevfgg3E
         AQIwsnI3uYWiofg7lMW9lgGvuyRElz0oL9oLHp3cwdG79Mry2STzsrB5WeDniA7xCXTl
         WLCS4vweVUHodgXXWZfwMAnU/b23visw6nswy+Nlj1WnEOFqJZcfTWFDlzyWHkAd8CYp
         L0/hOlRjqXnXSvI+sg4eUk5QSkprdl28JV5sYOltOotXgO1uKFAtv10iLBbCIxJmWO+r
         kGMA==
X-Forwarded-Encrypted: i=1; AJvYcCWP0d18A2BWNCJXz+ugI/yG7kbXrkoVA6vDf4SYMbj/bVOIRe7IWAjCg8aidyahhHii2rFeRaWAsBo5vmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOniypIL3gVAMmq4wjcwGLpUqEqE8A+dkNyGTJHgu5sEAroJIG
	oyT1ijGe1N9d5AuzAayaA0HWnQ0a0y+kULY400vxOWxuiyL37YYIGTIdhOC5b0kjlDPn+AqqF9A
	o83fZnyvsUlKzf1xpcRuZZRTRD/G+ci8KxJhQNtVohwEB4wSrP3NWeg==
X-Gm-Gg: ASbGncvIpzFV6TbXacVRDsF++8LL/sjc+jVln0eIzPLZPtacC9K6Y/4vGJgdiggGjac
	yYqqr7HgUB0pgk7fYuGm7LmRH9pDIQe5JSN0oXvRmON8XMHt66ws8Gss6WZPkqGK/I2I4w96+se
	/QRoloqCVpUFeKiCJUDF9dLzq5xYhnSNPIyArRmoTISbjhDyvWIWU=
X-Google-Smtp-Source: AGHT+IEhGi2LQFwvFRnaQacV1MVwRNQX6iJFqdq8RTHLH5cJ5UYZlyhVM7R4mWOQ9PxvwUNpMYblc6WfEAt3Ca+JqI4=
X-Received: by 2002:a17:907:c717:b0:ac7:81b0:62c9 with SMTP id
 a640c23a62f3a-ad21b42627amr364284266b.20.1746809603331; Fri, 09 May 2025
 09:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <20250309151907.GA178120@mail.hallyn.com> <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
 <20250506132158.GA682102@mail.hallyn.com> <CAKPOu+9JCLVpJ-g_0WwLm5oy=9sq=c9rmoAJD6kNatpMZbbw9w@mail.gmail.com>
 <aB0sVcjFZaCVEirH@lei> <CAKPOu+89=+SFk1hKGLheMtPq+K47E9FRCo1DBQo9zGMwW=Tr2w@mail.gmail.com>
 <87h61t7siv.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87h61t7siv.fsf@email.froward.int.ebiederm.org>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 9 May 2025 18:53:11 +0200
X-Gm-Features: ATxdqUFC9_hHEUoh5M3wGZU19wIBs4HyJyr3wHdymfUQLj3BgYhzKvRJc8bf1HM
Message-ID: <CAKPOu+8uw6SCO_hhOy_Kc_XihTDvJGoPrC1ujAHPYuiBghUb1g@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: sergeh@kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, 
	paul@paul-moore.com, jmorris@namei.org, kees@kernel.org, morgan@kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:45=E2=80=AFPM Eric W. Biederman <ebiederm@xmission=
.com> wrote:
> In particular __is_setuid or __is_setgid being true guarantees
> that has_identical_uids_gids will be false.

Sorry, no, that's completely wrong!

__is_setXid() compares effective with real.
has_identical_uids_gids() compares effective with effective, real with real=
 etc.

See the difference?

> Which means has_identical_uids_gids adds nothing, and the patch is
> pointless.

Also wrong. If that were correct, then my patch would not have an
observable effect. But it does. Try it, try the small program I
posted!

It seems your whole email is based on this misunderstanding. Please reconsi=
der.

> If your concern is LD_PRELOAD and the like please don't play with
> the uids/gids and instead just make certain bprm->secureexec gets
> set.

LD_PRELOAD is not my concern at all. I just observed that the current
kernel behavior can annul the LD_PRELOAD/suid protection as
implemented in glibc.

> I see no evidence
> in this conversation that anyone has surveyed the users of NO_NEW_PRIVS
> and verified how anyone actually uses it.  Without such evidence we
> have to assume that userspace depends upon the current behavior.

That's fine for me. But this behavior should be documented, because it
is rather surprising.

(In any case, we will keep the patch in our kernel fork because we
need this part of the kernel to work properly. Our machines don't run
any code that depends on the buggy behavior.)

Max
