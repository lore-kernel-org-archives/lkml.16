Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EF1C5F10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000860; cv=none; b=fBSKXtY3bzW6zIvhVDXfokMKTq67TQ81f1izbvBk60WeaJL3HWo/ey1rTHXzm1HBEJWhXo1Aqv4PYTBt4ANWeTjNo8z9yDayarhim9ir8oFg6fohT57SyPBuJTsSnZTAXpRwAAbiTzFVWCIX68u6lJgNBwNXvUFGxVz7Thfqx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000860; c=relaxed/simple;
	bh=2jTyaZEVZCDBOYHIG9nqVE9O1ZGXwzKw5BHDVbCFVlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R15EP0YOAUiMjTK6gxMFq92vTRmyIfcqi0MDWZiVRROzHPrbWOIulRMnpSjZaExeZoZzcUEquL5BFNw2sS3qlBeCXdYgRseSWM88BZKFLC9NRWthtDxbl6W3/E25bZiYM1aadk2uT6jq7nBuwyZPyA/301mvN65C8Ym05z/6EFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y1aVgGB8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y1aVgGB8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553e5df44f8so1598957e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751000857; x=1751605657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4A7L9oBOR7PWGFeQM6s9A8luVlFRq3afb/H7jm8mtpw=;
        b=Y1aVgGB8NHRnGy9e8ovMXPhgR6al/f41FmYy+aL6JhrNiKrb1/DH32FeEYadYlfg7G
         fSeRMAISlSFKqgOmNHfuupK/btFUQleIQNqt2EjALJPSCqYRVx5XzYDVrJvXsuqISB7D
         abwYkY50V/X5gkJRlkmrdLaTs4r+7kByKPK8GEO5Ezb8H+4TyyFkjtPMNCtCuUi7gFaE
         ckAZwzRZTJG19GJV5PQMqeP8tvK2q5+NE/LX7DvaS17tjOGjO/BwaHKihlFFZ2/kYUh+
         kCDBDdieHcKgjOJ+jPG1uuG4zAecWcX/fPdjhhhwYDIleqgZN9tBEZ165DDkOib5GQW3
         QLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000857; x=1751605657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4A7L9oBOR7PWGFeQM6s9A8luVlFRq3afb/H7jm8mtpw=;
        b=dOUjygWmT1DvGkLeMTOiujYXcAtN+jSrEUnZk08N4X8cBCG8f626gQtbRqn5xEQ1Fd
         sXsKcf5GU/VCFa1aiBhmX6I2IOok/QOu4YWkXP7E6e16KxuWNOQOxXL7xNU0T+3lB3uv
         wpFYVwzRMdx6McfWJ12f56Xnfxsm93S+432oyJNTNXTXVF0paxVtfGIho9VcFRsbHVDP
         qvMcP2BzowVVXZRmbCE20P30ddPC1X5INA25dn6idGRTa4Tvxca3KkuAwNzvg3gtIEaj
         JeBUQEVxEpLwJ3MaNV/J18imv7mjtr+VEbr+fquvxaIt6SXfdloUYKtZxlhrjkj5wuuW
         4dcQ==
X-Gm-Message-State: AOJu0YwbiKs47KkRnyyRQ7I+OGUwdZPx1oDv2JcgebK40BPv7WwUEFiK
	QVTyOAqo6d8EmPYoYPpIslLxlNyN2MCr9BlN34asw9o+kuKu95Ob0AiVV7kuGBcScCjem2JQjZd
	QA8gHHg68bu01PwfZbPZPsA82z388wLjO8yFcS6YRFRUQQeWoI4oHiwE=
X-Gm-Gg: ASbGncvIGH6a8yWcZnaQTVa/Pn9uxBZKtX7Hin1V3tZ4IqnhroKmZs9cyfq7SYaD0S0
	I7/Vzyn9Q0OlD9ZjsqioWzo8mAw1CydDsuDnZzAjB3sy+LWt1HzS/0bHEO6Fc5t6h0mYujEDmoq
	XlGvFm9EBQK1/VLMeRnM8nbMUKsyKF9Gsrrv0klIEmYizC7dMlDn/Va+p6UFgfOQjPsyHqwd8LQ
	+6BvXKFPyQ=
X-Google-Smtp-Source: AGHT+IHFd/GSAXNRNxFTF0LRQgz6ri1puABY2Ac0mTsP3NA1X04IG6EZmsIhm+tJdZcYM08CHCqtcRGrtARbEE8gTkI=
X-Received: by 2002:a05:6512:1246:b0:553:aa2f:caa7 with SMTP id
 2adb3069b0e04-5550b88cd1emr592637e87.36.1751000856677; Thu, 26 Jun 2025
 22:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.444626478@linutronix.de>
In-Reply-To: <20250625183758.444626478@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 22:07:24 -0700
X-Gm-Features: Ac12FXweFyiwFx75YwCZ8m7yeIqdL1KJZjXU9Ynl5dP9hKBG-nBooG0LsViCxwA
Message-ID: <CANDhNCpmpftcJ2UfQ=dFL-ygvCFGR4rpfd4qStEcF6R-KeM6Xg@mail.gmail.com>
Subject: Re: [patch V3 11/11] timekeeping: Provide interface to control
 auxiliary clocks
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> Auxiliary clocks are disabled by default and attempts to access them
> fail.
>
> Provide an interface to enable/disable them at run-time.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V3: Use kobject.h, clockid_t and cleanup the sysfs init - Thomas W.
>     Use aux_tkd, aux_tks for clarity - John
> ---

Acked-by: John Stultz <jstultz@google.com>
