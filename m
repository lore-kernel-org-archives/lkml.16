Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B5296176
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360789; cv=none; b=g9yQ9V+LpnZSh1+5zucQMRHbUN0J5Ge//2nu2cN4d6RWlJ5POHcB4HFOB+STPN88PWJrbwoYHXbsjbDB4dLdlDM3RBy9XZDtv9H2c1ZZSHe74uztzHpyEgGB3x4QVujzWrycKKIFBNZQbstTsejGBDAXMMk/ytuQkCRat3Z6oCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360789; c=relaxed/simple;
	bh=/fw0aHXXg7z4Hgf4IA+Uzoiq/Cwny0deEwiWzOIl2X0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t3JI2GDJKPB39YLjJYnq/FJahRDs1+uuaVE0q6gQtpuyGjADtTMk4oZMJD3o+2l+6YuIcBwsdcsiPvkizawOKr5CMCY3cMlyWS28AW4KMckIItSfBzvP9fhzDx1W44UJKYEknxO8qEBtGYw1ZNx3JZWQDi3g6y7ep/7rXGt2eyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKIoKpkJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKIoKpkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4kbzhowOrdb284WCQY6VYg5xlBwQ2Vxr3h44Uzh92yk=;
	b=fKIoKpkJRNrOcXqK/EGaZF7D8cwWx5aSVkixqUXcWUqqdopDpO/LCn+aSwbJgIzciP0fdD
	Tm1dtKJTOvSPmbOiQu8+uiN5YYJb1SX7Y/tKdGUIQkDpepbhOPOvCsVbadMtlzmEPNDJ6p
	R11ud0TgyTXy4A3bvqEKXXyPKaN1ByU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-GoBai_T5PfyECqh5aRZ93Q-1; Fri, 11 Apr 2025 04:39:45 -0400
X-MC-Unique: GoBai_T5PfyECqh5aRZ93Q-1
X-Mimecast-MFC-AGG-ID: GoBai_T5PfyECqh5aRZ93Q_1744360784
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cec217977so10389785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360784; x=1744965584;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kbzhowOrdb284WCQY6VYg5xlBwQ2Vxr3h44Uzh92yk=;
        b=UMWhezPFsYOxdP/Z49+VZL82sU6LAivTVCjwI7LBsXEsCyO8k4qTOpVzDCxCphwVXb
         us38s5xTeeZwHM4KGRjqRilwq7C6slWe9ij6FYPoY/MeXRJ16kZNoscxXm9jOOJEn/NL
         MXu9MhxNKtZNpwvPL/FYRDzvmVcfQ0RMgUS0ojbXUZEQB30yUWnIDQMgVT4sVhjBDf4c
         u3Q9IYw6gSaS0l5yQc5oTUUofpbQKn21fXHg9yU8HmJv+Zw3N/qAaPz/swJGf2GT4dCr
         ZVPoEfjC+tzLPvYsAoguimZ5/mQHwOHF/btqKiVW07CgC1Hs/ne7K6MfqK6NJoBifYnE
         Aozw==
X-Forwarded-Encrypted: i=1; AJvYcCU3NsT+18nhZkoYmcl7WYaBU4sQ/Lvnnrfah17UbqnNpD33wv9YIOoDiahQ7CpzT9hXJJMfbk8SL+CZEtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyF46dq6x4f1qGCFnpcOFzAaS7hEdT98L9NBGtB/8DqzNvNqGo
	ldj75LlVOoii4Y8ZQlLj4+HVfokKjzi0rdgD9uszeoRhGwU+CWOaLh51tMViekaPAtgilJnWDiq
	Oh1EOF92CoRoSLcrruBdfEue5aWhvz0gN543/4TZ9YIJ2P23N5RqIljwnFmw7nw==
X-Gm-Gg: ASbGnctYbVEdy51xZY/axvLpGQvuk0lrE+Q9qL8tWjAKH6jTAiHVDa+uddwy265qEgV
	EdC/3Qd11eIfsU+MN3ch0klS5U94n/UqTRoR7EZITAZ05Y5O5lnLf3BOSZqUR53/GMqFh/+AW3J
	bS0yoDv8zoVLCZJkFjgZgZ5mNpnYQkzE3X4Ad3g6utFxvbL0QlhWtBhQX7Jcd92sSDc5paFp02T
	S8BqQalOMy3Bvgb/vM62niUyeABbKI1UhoSNIp8AYxNt9FadyggYep16EIjjPXzvKNyK0hUBVco
	2C4o1rflPG1CBYZbDIC55DsPK3UoiZzaiIWloQ==
X-Received: by 2002:a05:600c:348f:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43f3a9b039fmr12927235e9.29.1744360783868;
        Fri, 11 Apr 2025 01:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJZJQoEi7GiI72EPYHpaydqlLw3rRu5pjFRDqfw++7ZZIgj9Ga/PdXmA0PYbR0EkLquJO+Ng==
X-Received: by 2002:a05:600c:348f:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43f3a9b039fmr12927025e9.29.1744360783464;
        Fri, 11 Apr 2025 01:39:43 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2f08sm76432275e9.12.2025.04.11.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:39:42 -0700 (PDT)
Message-ID: <40ad385f81151320a3c9d380d35a0504d15e0041.camel@redhat.com>
Subject: Re: [PATCH v2 03/22] rv: Let the reactors take care of buffers
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Date: Fri, 11 Apr 2025 10:39:40 +0200
In-Reply-To: <fb397e38b56f3eab7b7f662fef4860ee4fbda873.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <fb397e38b56f3eab7b7f662fef4860ee4fbda873.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Each RV monitor has one static buffer to send to the reactors. If
> multiple
> errors are detected simultaneously, the one buffer could be
> overwritten.
>=20
> Instead, leave it to the reactors to handle buffering.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
> =C2=A0include/linux/panic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0include/linux/printk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++--
> =C2=A0include/rv/da_monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 45 +++++++-----------------------
> --
> =C2=A0kernel/panic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++++++----
> =C2=A0kernel/printk/internal.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0kernel/trace/rv/reactor_panic.c=C2=A0 |=C2=A0 8 ++++--
> =C2=A0kernel/trace/rv/reactor_printk.c |=C2=A0 8 ++++--
> =C2=A0kernel/trace/rv/rv_reactors.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A09 files changed, 50 insertions(+), 48 deletions(-)
>=20
> diff --git a/include/linux/panic.h b/include/linux/panic.h
> index 54d90b6c5f47..3522f8c441f4 100644
> --- a/include/linux/panic.h
> +++ b/include/linux/panic.h
> @@ -3,6 +3,7 @@
> =C2=A0#define _LINUX_PANIC_H
> =C2=A0
> =C2=A0#include <linux/compiler_attributes.h>
> +#include <linux/stdarg.h>
> =C2=A0#include <linux/types.h>
> =C2=A0
> =C2=A0struct pt_regs;
> @@ -10,6 +11,8 @@ struct pt_regs;
> =C2=A0extern long (*panic_blink)(int state);
> =C2=A0__printf(1, 2)
> =C2=A0void panic(const char *fmt, ...) __noreturn __cold;
> +__printf(1, 0)
> +void vpanic(const char *fmt, va_list args) __noreturn __cold;
> =C2=A0void nmi_panic(struct pt_regs *regs, const char *msg);
> =C2=A0void check_panic_on_warn(const char *origin);
> =C2=A0extern void oops_enter(void);
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 4217a9f412b2..1b7eebe13f14 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -154,6 +154,7 @@ int vprintk_emit(int facility, int level,
> =C2=A0
> =C2=A0asmlinkage __printf(1, 0)
> =C2=A0int vprintk(const char *fmt, va_list args);
> +__printf(1, 0) int vprintk_deferred(const char *fmt, va_list args);
> =C2=A0
> =C2=A0asmlinkage __printf(1, 2) __cold
> =C2=A0int _printk(const char *fmt, ...);
> @@ -213,6 +214,10 @@ int vprintk(const char *s, va_list args)
> =C2=A0{
> =C2=A0	return 0;
> =C2=A0}
> +__printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
> +{
> +	return 0;
> +}
> =C2=A0static inline __printf(1, 2) __cold
> =C2=A0int _printk(const char *s, ...)
> =C2=A0{

From the RV perspective this patch looks really good to me, although
you're doing a bit more than just RV here.
I hate to be the one telling you to split patches (22 is already scary
as it is!) but probably the vpanic and vprintk_deferred belong in
separate patches.

Feel free to mark the RV part (and also 1/22 2/22)

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

> diff --git a/include/linux/rv.h b/include/linux/rv.h
> index 3452b5e4b29e..c7c18c06911b 100644
> --- a/include/linux/rv.h
> +++ b/include/linux/rv.h
> @@ -38,7 +38,7 @@ union rv_task_monitor {
> =C2=A0struct rv_reactor {
> =C2=A0	const char		*name;
> =C2=A0	const char		*description;
> -	void			(*react)(char *msg);
> +	__printf(1, 2) void	(*react)(const char *msg, ...);
> =C2=A0};
> =C2=A0#endif
> =C2=A0
> @@ -50,7 +50,7 @@ struct rv_monitor {
> =C2=A0	void			(*disable)(void);
> =C2=A0	void			(*reset)(void);
> =C2=A0#ifdef CONFIG_RV_REACTORS
> -	void			(*react)(char *msg);
> +	__printf(1, 2) void	(*react)(const char *msg, ...);
> =C2=A0#endif
> =C2=A0};
> =C2=A0
> @@ -64,6 +64,11 @@ void rv_put_task_monitor_slot(int slot);
> =C2=A0bool rv_reacting_on(void);
> =C2=A0int rv_unregister_reactor(struct rv_reactor *reactor);
> =C2=A0int rv_register_reactor(struct rv_reactor *reactor);
> +#else
> +bool rv_reacting_on(void)
> +{
> +	return false;
> +}
> =C2=A0#endif /* CONFIG_RV_REACTORS */
> =C2=A0
> =C2=A0#endif /* CONFIG_RV */
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index 510c88bfabd4..15f9ed4e4bb6 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -19,45 +19,22 @@
> =C2=A0#ifdef CONFIG_RV_REACTORS
> =C2=A0
> =C2=A0#define DECLARE_RV_REACTING_HELPERS(name,
> type)							\
> -static char
> REACT_MSG_##name[1024];								\
> -
> 												\
> -static inline char *format_react_msg_##name(type curr_state, type
> event)			\
> -
> {												\
> -	snprintf(REACT_MSG_##name,
> 1024,							\
> -		 "rv: monitor %s does not allow event %s on state
> %s\n",			\
> -	=09
> #name,										\
> -	=09
> model_get_event_name_##name(event),						\
> -	=09
> model_get_state_name_##name(curr_state));					\
> -	return
> REACT_MSG_##name;								\
> -
> }												\
> -
> 												\
> -static void cond_react_##name(char
> *msg)							\
> +static void cond_react_##name(type curr_state, type
> event)					\
> =C2=A0{							=09
> 				\
> -	if
> (rv_##name.react)									\
> -
> 		rv_##name.react(msg);								\
> -
> }												\
> -
> 												\
> -static bool
> rv_reacting_on_##name(void)								\
> -
> {												\
> -	return
> rv_reacting_on();								\
> +	if (!rv_reacting_on() ||
> !rv_##name.react)						\
> +		return;				=09
> 					\
> +	rv_##name.react("rv: monitor %s does not allow event %s on
> state %s\n",			\
> +			#name,				=09
> 				\
> +			model_get_event_name_##name(event),=09
> 				\
> +			model_get_state_name_##name(curr_state));
> 				\
> =C2=A0}
> =C2=A0
> =C2=A0#else /* CONFIG_RV_REACTOR */
> =C2=A0
> =C2=A0#define DECLARE_RV_REACTING_HELPERS(name,
> type)							\
> -static inline char *format_react_msg_##name(type curr_state, type
> event)			\
> -
> {												\
> -	return
> NULL;										\
> -
> }												\
> -
> 												\
> -static void cond_react_##name(char
> *msg)							\
> +static void cond_react_##name(type curr_state, type
> event)					\
> =C2=A0{							=09
> 				\
> =C2=A0	return;					=09
> 					\
> -
> }												\
> -
> 												\
> -static bool
> rv_reacting_on_##name(void)								\
> -
> {												\
> -	return
> 0;										\
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> @@ -170,8 +147,7 @@ da_event_##name(struct da_monitor *da_mon, enum
> events_##name event)				\
> =C2=A0		return
> true;									\
> =C2=A0	}						=09
> 				\
> =C2=A0							=09
> 				\
> -	if
> (rv_reacting_on_##name())								\
> -
> 		cond_react_##name(format_react_msg_##name(curr_state, event));			\
> +	cond_react_##name(curr_state,
> event);							\
> =C2=A0							=09
> 				\
> =C2=A0	trace_error_##name(model_get_state_name_##name(curr_state),
> 				\
> =C2=A0			=C2=A0=C2=A0
> model_get_event_name_##name(event));					\
> @@ -202,8 +178,7 @@ static inline bool da_event_##name(struct
> da_monitor *da_mon, struct task_struct
> =C2=A0		return
> true;									\
> =C2=A0	}						=09
> 				\
> =C2=A0							=09
> 				\
> -	if
> (rv_reacting_on_##name())								\
> -
> 		cond_react_##name(format_react_msg_##name(curr_state, event));			\
> +	cond_react_##name(curr_state,
> event);							\
> =C2=A0							=09
> 				\
> =C2=A0	trace_error_##name(tsk-
> >pid,								\
> =C2=A0			=C2=A0=C2=A0
> model_get_state_name_##name(curr_state),				\
> diff --git a/kernel/panic.c b/kernel/panic.c
> index d8635d5cecb2..df799d784b61 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -277,17 +277,16 @@ static void panic_other_cpus_shutdown(bool
> crash_kexec)
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - *	panic - halt the system
> + *	vpanic - halt the system
> =C2=A0 *	@fmt: The text string to print
> =C2=A0 *
> =C2=A0 *	Display a message, then perform cleanups.
> =C2=A0 *
> =C2=A0 *	This function never returns.
> =C2=A0 */
> -void panic(const char *fmt, ...)
> +void vpanic(const char *fmt, va_list args)
> =C2=A0{
> =C2=A0	static char buf[1024];
> -	va_list args;
> =C2=A0	long i, i_next =3D 0, len;
> =C2=A0	int state =3D 0;
> =C2=A0	int old_cpu, this_cpu;
> @@ -338,9 +337,7 @@ void panic(const char *fmt, ...)
> =C2=A0
> =C2=A0	console_verbose();
> =C2=A0	bust_spinlocks(1);
> -	va_start(args, fmt);
> =C2=A0	len =3D vscnprintf(buf, sizeof(buf), fmt, args);
> -	va_end(args);
> =C2=A0
> =C2=A0	if (len && buf[len - 1] =3D=3D '\n')
> =C2=A0		buf[len - 1] =3D '\0';
> @@ -477,7 +474,17 @@ void panic(const char *fmt, ...)
> =C2=A0		mdelay(PANIC_TIMER_STEP);
> =C2=A0	}
> =C2=A0}
> +EXPORT_SYMBOL(vpanic);
> =C2=A0
> +/* Identical to vpanic(), except it takes variadic arguments instead
> of va_list */
> +void panic(const char *fmt, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vpanic(fmt, args);
> +	va_end(args);
> +}
> =C2=A0EXPORT_SYMBOL(panic);
> =C2=A0
> =C2=A0#define TAINT_FLAG(taint, _c_true, _c_false,
> _module)			\
> diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
> index a91bdf802967..28afdeb58412 100644
> --- a/kernel/printk/internal.h
> +++ b/kernel/printk/internal.h
> @@ -71,7 +71,6 @@ int vprintk_store(int facility, int level,
> =C2=A0		=C2=A0 const char *fmt, va_list args);
> =C2=A0
> =C2=A0__printf(1, 0) int vprintk_default(const char *fmt, va_list args);
> -__printf(1, 0) int vprintk_deferred(const char *fmt, va_list args);
> =C2=A0
> =C2=A0void __printk_safe_enter(void);
> =C2=A0void __printk_safe_exit(void);
> diff --git a/kernel/trace/rv/reactor_panic.c
> b/kernel/trace/rv/reactor_panic.c
> index 0186ff4cbd0b..2587f23db80b 100644
> --- a/kernel/trace/rv/reactor_panic.c
> +++ b/kernel/trace/rv/reactor_panic.c
> @@ -13,9 +13,13 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/rv.h>
> =C2=A0
> -static void rv_panic_reaction(char *msg)
> +static void rv_panic_reaction(const char *msg, ...)
> =C2=A0{
> -	panic(msg);
> +	va_list args;
> +
> +	va_start(args, msg);
> +	vpanic(msg, args);
> +	va_end(args);
> =C2=A0}
> =C2=A0
> =C2=A0static struct rv_reactor rv_panic =3D {
> diff --git a/kernel/trace/rv/reactor_printk.c
> b/kernel/trace/rv/reactor_printk.c
> index 178759dbf89f..a15db3fc8b82 100644
> --- a/kernel/trace/rv/reactor_printk.c
> +++ b/kernel/trace/rv/reactor_printk.c
> @@ -12,9 +12,13 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/rv.h>
> =C2=A0
> -static void rv_printk_reaction(char *msg)
> +static void rv_printk_reaction(const char *msg, ...)
> =C2=A0{
> -	printk_deferred(msg);
> +	va_list args;
> +
> +	va_start(args, msg);
> +	vprintk_deferred(msg, args);
> +	va_end(args);
> =C2=A0}
> =C2=A0
> =C2=A0static struct rv_reactor rv_printk =3D {
> diff --git a/kernel/trace/rv/rv_reactors.c
> b/kernel/trace/rv/rv_reactors.c
> index 9501ca886d83..4ce6ebb9d095 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -490,7 +490,7 @@ void reactor_cleanup_monitor(struct
> rv_monitor_def *mdef)
> =C2=A0/*
> =C2=A0 * Nop reactor register
> =C2=A0 */
> -static void rv_nop_reaction(char *msg)
> +static void rv_nop_reaction(const char *msg, ...)
> =C2=A0{
> =C2=A0}
> =C2=A0

