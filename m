Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E0222ACF3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837373; cv=none; b=K4q7GFdYUhkQuM1IkDTQzEOXy89lmMQYdtWhpuFunAuiE2pWVYoVa/VTxJbQfLpEf54wUmjAqdjBOA760G6j286eUAlch7Y86e/TsIW/SpXx48ZS9IC8YBY6lezQJU31bu8ZZauEpHgkWhsQJdz/MtFn9CvCjqBe6Nz2jMLwtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837373; c=relaxed/simple;
	bh=9cmE/x9SF8N0mzKbcfHCN6giVnuVjrUq49cv5yAJ3dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIyzajbLWpGqENyBx47QG9k/POkG4dlr/JtHDM6kQpUh+GnlY3VJ2jvgznS6VKZrc2Eebskhn+5iv7/ptsCrLm/O57zpJExr9bzOFIXGFfg4if5dayFkvOdNtWgdqeqiH67+jV5dChtKorsPbcYvnvl7SQrbF+mx5yJS+fw+Hws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZMPSI8CL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZMPSI8CL"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso4099189a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749837369; x=1750442169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7bjFF2c1v0tAi/T+zj/04ixyFcwt4O9RAaNc5aiFloU=;
        b=ZMPSI8CLmvMQWq0BxJcCkwBDEyWeGAeptOJ4qqxv4hdCrjpixTeA7I4xoEUIFSPc/5
         VbF/k/WJtCEYgi5unyGXFDMQC1qhDML3yz5sVQcvG1IshedeOYlDvXeeAOAKLD3VyUC/
         0WzFPwkVfHP5UoNN+inlgfkDTQOORRYyW/fzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837369; x=1750442169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bjFF2c1v0tAi/T+zj/04ixyFcwt4O9RAaNc5aiFloU=;
        b=rOVfVlwISUJ5MiIAdUF8kjEFlV6PfKM8uliX0m66smEy/3VW7yWk4sPU/Ei2Q3KprE
         eC554owZ0RmJe6omA5lUPIe+Zfq/A6Gc50HzaG2NTeQyOsX2m04T1HMONcuqtpGdLEcn
         AZ/goi/yWDb2998KqHCIol8/A4jnQcb/GcYj29Nxl9IQrPlbfMzDs6uUpZnQ84WtIqzT
         dHirGH8g0J/4Ov4PVz1qj3Jo/vlBiCM45W/5BWljn9Ljw6Z6Vld27uwlDfH1jJ1w8Q/H
         GZ8JmfyjVGkZeWT2sOX5zyz4Cn+hd3+rJIrKJUHLnR8DKfwn4gdLAYh+QYh+VgS2G2zy
         MeVg==
X-Forwarded-Encrypted: i=1; AJvYcCWV6PfWN3kucCOI6jraWewM9oVaNowPZe0XyHkYKmUvvLELYAdTYSzPlbiGtNFodTnlIITgKd15TOdlmc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mnfVQUQ3bQoNCemqhz2OtX/ItGAtMfFH/knWaUtJ542ISsqi
	McJ9oMXfMYbozXD76OvN99bzEC/O/GR46JW5eG7iDLfaVOx+Mf+H+gxTLlK/Ch0CHCQ3/7nSuxp
	yCHVO4XvE1w==
X-Gm-Gg: ASbGnctogf/8bWWC0diD06ibu/y1oFtxvJ/ogbs07xa3kM4I2k9hauxTQQvY/33To4H
	pse3GWMUoJEFGlb7ccOP3A4MK1JRJvgUaGaQwzQLRnKs7WKh9dZfq1cmCs8OWsgTwyJhMi4RYRM
	ZfFZwe6c+5KDR63GDs+XvIP/AB7X9O/W2s68Lz47FSZNu5RsgBZcnOXPOBJ0z34h0d8M63OdT5n
	ek232gX/jtmMdevg8AECkzyGa4bXlJVS21PD+SMPxQ6yB+WoXZyuNLD5Ci4jRQGVZGauxcO9Y7w
	JIONjPjkmjw/82dqlfGIFee2MrG5nJJ5nSiMhKT63/F0YIpWDnCqQXttRiHbrHSP/aCaUB8NClc
	BFkTVFYCJY4oDoSEZakn7xadRxjGVKESmgHFz3wCU0gDLJw==
X-Google-Smtp-Source: AGHT+IG5TdTD7Lh/tM+TISs6R2ky4yaWNi9lYaRbMWGAaKieiTlor82q9sArOvLfhznoQM/9DcRb1Q==
X-Received: by 2002:a05:6402:42c3:b0:604:e602:779a with SMTP id 4fb4d7f45d1cf-608d097ab9fmr133790a12.28.1749837369176;
        Fri, 13 Jun 2025 10:56:09 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4ae32a7sm1501028a12.77.2025.06.13.10.56.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 10:56:08 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3556934a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:56:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXODoeax2fsmIyJNlazcZ2GhIjkY/RVgyGs3A+7XObKdjXRruA2jekOMjAMqYD62BplY+c+tFpKk0rHpMA=@vger.kernel.org
X-Received: by 2002:a05:6402:2355:b0:608:6501:6a1f with SMTP id
 4fb4d7f45d1cf-608d0837a32mr169376a12.1.1749837368073; Fri, 13 Jun 2025
 10:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGCho0V0x_Y2+vg5G8-r45Xc6uftLbZK5K1=vpavd_4783fogQ@mail.gmail.com>
 <20250613172650.GA26022@redhat.com>
In-Reply-To: <20250613172650.GA26022@redhat.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 13 Jun 2025 10:55:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whhcUJU20xVOPRDOGH1Yvt6KD2ao=xDk_dk0qLHZHD1hw@mail.gmail.com>
X-Gm-Features: AX0GCFtTTKrFInkTh6jFyh_Xi-b0dUhPbxbYC0wvZShcJRJTupCmNumFoq0nUxE
Message-ID: <CAHk-=whhcUJU20xVOPRDOGH1Yvt6KD2ao=xDk_dk0qLHZHD1hw@mail.gmail.com>
Subject: Re: [PATCH] posix-cpu-timers: fix race between handle_posix_cpu_timers()
 and posix_cpu_timer_del()
To: Oleg Nesterov <oleg@redhat.com>
Cc: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Zander Work <zdw@google.com>, 
	security@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 10:27, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Add the tsk->exit_state check into run_posix_cpu_timers() to fix this.

Thanks, I'll just apply this directly since I've been cc'd on the
whole discussion anyway.

             Linus
