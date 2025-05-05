Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3424DFED
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447950; cv=none; b=IxpF8Ymv/RJcOCwm1bjNQOp1/50uozArSheb1QouzYdt7Tzw6I7feVZva79ySkgpXgC3cYRXgYbR89zFh35/biVd9qDOh5+aJthDL8y5f/NKTdlrCS2HIPYsIXQPbvDbNGbFNodABv+PBDlyL0OG5sQw6jU13P44ThwmMwJUy7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447950; c=relaxed/simple;
	bh=dM29SgxV4uJqOXwk6Y/1r+OBrOu+YGmmKgFsQvUqo1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ1F/3xVPh17KmlhnzD+fb3jv3LD1Mf/PZ4wf45+kMmEgTZgksme9q7i8EZalBli4vIH4d2i+ZEulNUSc88H9epWgCUKu15Za03wZuMThQc6kRPT4IfoTgApN+Mc/FNak1lJQMwc2GAcL0CrPU8lhkzClfb89N2GmRgecAgFwQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BCUuBria; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BCUuBria"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso8314674a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746447947; x=1747052747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul3mmPCYXNLg1qFjGH68tfe8ccOUp/QNiNXPNMQhrj0=;
        b=BCUuBria4cP+O0SHagqdmWJ8OGA64FkXn0HT7Ksj2CTg8VAT+eWs/CNZRPVfDqH2X0
         2QbhU+Z8oMX8k3nyAJtDE84X2ioLVDwDZU09fNeOV9zb7J7ivqqdPOuSEcclOx0F9HqK
         QvnUpd37/L3658l27UhWCcLeh7MOLMglNpSx7XwP6einxPsih39Mm00+W0C32NDabE1w
         bS98F9A3xdfIbiWlP6Uzc28ppZy0yMYOkVAp8wag9juIkH6C9xwzMIjCdEQkxsEGW7Qp
         ynJsGmrYmJIKux28qKZnF8kQyWFb8ipTBpQQeiCnYv6U7HFAAEifiwc0XzrfXmpRD4Xl
         BDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447947; x=1747052747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul3mmPCYXNLg1qFjGH68tfe8ccOUp/QNiNXPNMQhrj0=;
        b=tocJHfpHjlvMxE3Z/JBqw+zK/MFAOby+zNsoH+Af/cspVZtWCMB78jsy+n+fmTRLwK
         /R3990s0tBcxOTKFvIUCq4pfBvLUo3cfG+QIEUAYwoaNCcAjudX1wQEqnczzhyuEl+ZD
         MIHF+ugWqLxffOTML1ib2w40QiZEgKl3LHiMQlIKK1OQ9mqdGk3XmcNNDbZNb4LZsiLI
         7ArU8a84WEIgjuMC0NxElQveVWfyanABn8OrDH1crIltB1D+cK44Mdesir/TF9LFyTfJ
         GwcZS6U4b//+a5vYjOp9dpz2uNos+ej++2cM0Aj1fnc6PxZ33m8V+gTqf4LizbUbQ+u0
         8brQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCiSY6l2g9E+gsbp0XwgPDQdn37Yp9TNHI0eAhgT/DXMMtrjucqp1FWWLG53RE+RuDDOwygMriRWU1Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypzUsxeqgOO8Qis0lU73euVswIklLYIg7I0Ka6DelAmuQZcDI2
	pKe3A/OnxpQSZw2kSx3076gAX/eD7kl+TCtNLzJvNWibWG6pcnXwoWdETfFsTho=
X-Gm-Gg: ASbGncv26ulG210Dt84R4yepOiDkeweAGtmhLhrHJdEkln0uLDrhBy0obOKZwIFPH1/
	tneY7L5HhB5Uj1CZOZSY8n2z3wzxi8vRNyqqzVGd5Msdx3C7ENpWIa1YeNiYRkFJngPcUyOYyt8
	TO8BJlIqUX5/dE2KWjNvl1vHmUeJyzoXQVB9igMIA9yZmCedur8HMrQCa6NcoVY/Xctm2C5Udgc
	d9ZchkIaw3Tkw/RgscSYhv6WPKYPiC/eJKUN2voivOy8sWvUzO/86jcjw4R+iV2cHNMtpGqh2lL
	iJ+TtnCbOVTQDSstF0RxdJ5ajKe6x3TvlSdipn2arJy5lPJL8q0=
X-Google-Smtp-Source: AGHT+IGJBYHVy0S7abha8Y0YbDnYtCH1096cp+aOxiQt/wTq+YnGfjzVIb9quv6PqCuPc7tysxT5LQ==
X-Received: by 2002:a17:907:8dcb:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ad1a4a8d95cmr669318066b.37.1746447946953;
        Mon, 05 May 2025 05:25:46 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147431sm488354366b.8.2025.05.05.05.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:25:46 -0700 (PDT)
Date: Mon, 5 May 2025 14:25:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6 04/22] rv: Let the reactors take care of buffers
Message-ID: <aBiuSckTNYeBvkKH@localhost.localdomain>
References: <cover.1745999587.git.namcao@linutronix.de>
 <833a4176f178d5d8d0acc40237e82b22f4e3c027.1745999587.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <833a4176f178d5d8d0acc40237e82b22f4e3c027.1745999587.git.namcao@linutronix.de>

On Wed 2025-04-30 13:02:19, Nam Cao wrote:
> Each RV monitor has one static buffer to send to the reactors. If multiple
> errors are detected simultaneously, the one buffer could be overwritten.
> 
> Instead, leave it to the reactors to handle buffering.
> 
> Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

The patch looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
