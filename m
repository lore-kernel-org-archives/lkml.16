Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F872636
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749774069; cv=none; b=c00EeCQhuLQK+ZBJVnqFUc42gHscUdi5Kkxq73sFQpB5RW6plsh9eXmrfw3QAqRKjEKSUo8HrQYFmLnvFBsbww0zUzgyak0swBHZrFqaqpEJ2KzUaT05Gq14H2Kr5E0wATKLeTIqWGrUIYPDU1oDpj3i0ENWqwrdnxQ3N1B4EMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749774069; c=relaxed/simple;
	bh=6oxAFf4++bRIonZ3ootT1Dvf/Qx41GTg5N6Oburkl5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdKTfYSgPD+lvLh2nILRY2xkwlGQOCc3ImEvQ69uix9crV/0wGFxk03NLvT6q2AnjWiZ29RqEe1V/LQ/1X6l95vZLKsEgofU6u4dAzYGl6n3JPge9LPPeCnWpWWJ/1hZxVKuGjlLYwXLCoRDps6W1X+tJajtAEqMlj6NN+WHdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywYKn3V+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywYKn3V+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5532a30ac41so1612964e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749774066; x=1750378866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oxAFf4++bRIonZ3ootT1Dvf/Qx41GTg5N6Oburkl5w=;
        b=ywYKn3V+d1F7Gon0NEKBwIHkHZmx68UG+OubeajPSYho51ssqDtuEwBlgyU/L9kE6a
         rZrMqHRzwyh83mXDgviLWQY1g9oyN1iPR64e7jmZPzfbw2wXOOr2q/iLlKQTRcAHf5Ni
         5wVb1GC4lGFKonw5hfvXxnQs5lh8uzDAle+eLRUwYBPbJxocPpA3yQA43uK8lRoVFdU4
         4LIvp0QPsPmajnORLPr/jZRLZlfeQ5FbBv+sLLpSAAJC9gUC9smcpedX90+MuEHWY939
         B0P31iS795Jg1ynmYGwyOPNqmCF9YU3XhMM9h97ytXJIqs582OHjfXrUtiyACqn9dkyd
         thoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749774066; x=1750378866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oxAFf4++bRIonZ3ootT1Dvf/Qx41GTg5N6Oburkl5w=;
        b=NO4AOifHvb0fRfTLKktt4mSKze4cIfImxMVaflo7WmL9/7HLtV/nfEFx1wPiN2GvDb
         dlnn98iIRh+DziTMwExZkC5EXKq3IwdTXl5efGMpVxiGab3rcHaJb579orfihW6/mmca
         FJzfjmpCyhYu9dSVOBRSfqgA4GFtbKvZOZflE75GrhhRgBkqZNgDkN8BFFAMvX9rd7Q7
         w6JfeNVuVBaYsXqtNreuawjNzn7GmgPdkAeZb/Rx6tBV9ISZZ/1wjFO84Mym8g1P6egf
         sJc7L89E674wHiU5jmnkvRbIl3ddg5oYSZlhUU07bPqFVCh62+xXHRhBSYWWCud17kFP
         N5AQ==
X-Gm-Message-State: AOJu0YzHaSoK+bsHV9D8Y3fpjZH4NzHVpQ1UaNrPHqQsRdbUy49Kip71
	3BBijkiZ+GhBjbYWADazTSrxnKdUBGmoGmYHpR5e7/MayxOC4dB2bJs0a5D1sHYH+uAf4cnctk4
	Jrtw5xDWMiOzrxxIjPIw1nn8Gi1TUodeZuvoqsqg=
X-Gm-Gg: ASbGncsYlntiT1kmtebLcqp7dBcxwozZE4uPlKk8n4FEuroxzGd+dX/C3aRrFQNXJqC
	GOg42W7AsACQnIw7VOIDDgZu0lJSeTncCVpbugBTo0WNKRyOfWKPy0YSKA2P/HnMqfZF3HFcAAB
	bWyPM4+IySwrv+uBQ1U1mcX4rsoL/ZyBdD7PuECePHkA/1amIBUR9wvmBoMY3Lo3BzxCHFsD5z
X-Google-Smtp-Source: AGHT+IGw36e7JsZbFXkPUbj7QsFJ7rhNdm3CEYKxP5q6L5ZJam/GXA6wfFRPajbARbP+m8y4DU/kklMEa0reYoZq27w=
X-Received: by 2002:a05:6512:b8c:b0:553:522f:61c9 with SMTP id
 2adb3069b0e04-553af90d703mr258113e87.1.1749774065557; Thu, 12 Jun 2025
 17:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.095637820@linutronix.de>
In-Reply-To: <20250519083026.095637820@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:20:54 -0700
X-Gm-Features: AX0GCFsrStyANSXghA2ujjwfGv8KljcDGy-5euaxgQLidATlo8os2dJMHAEh1WE
Message-ID: <CANDhNCpBfEYadVAmBj5_AsFU=TDUGc5bKMAKm5=ZLyTmkjB+pw@mail.gmail.com>
Subject: Re: [patch V2 08/26] ntp: Rename __do_adjtimex() to ntp_adjtimex()
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

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Clean up the name space. No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
