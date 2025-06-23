Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBF15383A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687503; cv=none; b=sy02JQzT/ZUs30RA/fIGPzVa3MyCBqAImudtMiCX2OUYBMpZqSCL0cqL7QRg8Pvmf0vbUK9dA0xpkuWh1vKKo/Okc8hY9gWVD0PnHYStCBc1LYBRfLawfYgUbDxp59Vgf12frS519RSAwAyuUs/q01+wRsFQfgSe80mHECnbVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687503; c=relaxed/simple;
	bh=FfP8tkdvG9UtNgg6dvh/7AgGSsN2krjZSQ2tXWpR92M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A94GVBxC3USpgmqjnlYecDf+XxLolovWVNARVWQkJshOIeSjGfQ59aCsqyJnT/lyizSOVNeXhjjTPY/ReG1wrFHtQbFx4HT1O6m+j4KSDdnYBPwcxeKp+tGySPPXM5LJeEJ4W61d7TLsEWIbh7X0tJkffzBV472JJ/42TnJjD7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OVzSW22R; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OVzSW22R"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad572ba1347so693095466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750687499; x=1751292299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiwWRM0CdO0mCYDwXynObL1UDQi5thYGbEgLeQCW4C8=;
        b=OVzSW22RFcDyb49ETz5JqHYi+9L1xano5JpEPzEPtCUxbuUO+UI4Ik9QTTQzuPK2Ze
         TJjUv+WwTS/W+QhsBUIXHWw/fZioo6pqiFJ8Tgu2WT0Xo8WNO7j+2PQD7QnSYUkQ9ekY
         caYRjk5BKlJBnz/Ve3MV/UsQPypUY6QqrracznT2HC/NQRxjxP834wtCub0wFbPdpOOS
         oHAaN9yLI1mR6vggmjkDPDIw7wZqwzbNrhWMq5KnpCGNuzz2rpDmuc4WBgNwMJgpYDvz
         ijANwa7qpPZeQuXLact/RbiYxT0Ag5CUEGFZ6L/C3bZAfbgKv9yP9wuZ2WYGI23e5hWA
         jvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687499; x=1751292299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiwWRM0CdO0mCYDwXynObL1UDQi5thYGbEgLeQCW4C8=;
        b=VV590E8UyF/meqO/HTLo+HYfeJYPxAQQtZChYWVfE/q8TU8A+wjc3jWHpfPft7PU2N
         fAnnqXPRGc0inYi90T2Ol+P/cVpz05lxys8PcNKpj/ekGrwtC61cTTrXhwZq8nB/y5Y/
         LI2sJ+LfdxaeBzloiNXRVQVDiSLuV95e0MAOLI3bjEUVZn7iEO+qfGMWize7VwWmOx3U
         YhyxiBu/16zQ4hq5GMh5/y5/81IHwdjpPXZQwazOGaKFj2R4mf8OGck71cZgVa0xRRDe
         223Up7jtELxkxZG1muVKAmWYNnS5oGHshlRjmYPa5n3aiis8sSAx2wSiQKSGGAzQshga
         3dpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjxlsAbHLrDAYQW2q3BA2mZ4sATuEeCKgqRO6UNU81xfI6Y7LYij9aWxLtv/xGdVbHvQag7ovfP+SOZJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXj44RtN/q7eJYRXmvGiakPZmbivJpp/mh/0MVXfOwRyNrzv6x
	yY8V8a9OnH8D40tYoe6yUIAyLTYF9iyVupRpGvBDLvf5Rk8LyJl65wlzqlzYySq5rGM=
X-Gm-Gg: ASbGncvJ1T4vFTSpeMTFlJCSnuP7eADeOeYZ+vtVGrvjHT7yuP3SOLUhubK8DV5JhOG
	HtjHS9x15CBYpvs4zFNMpGvSNsqZpHRurL7o/P9qC7LOKydx4XsKOjafLP7WBGnRxpJvX5B1cSQ
	KbKn8tF3y/1jQz9uxXIS9ZaJ20ZNO3WZIfaruJjRxTVedAVNfSxReoFlb49HoDQ0vuKsMp2mWjm
	ebl+84G9MhUkUcGNnUd4jYccdVAZoqHubfNQOgbLuvAxr7HWQcriK7RN/Zlea28SxFOmRoVtEH3
	dZHQ1l++dXgCSHsCIvxsPi963ovG3MkpY6ILcwfYbG3DUyc0AhCxSAanALDNiYjC
X-Google-Smtp-Source: AGHT+IEZK+cKcXwj6H745JxNBD6L9r2Ck22uk68tyKhRVlMQYWUpQGiQ1xsjaqcD2gPzsaACfHFbhQ==
X-Received: by 2002:a17:907:d2c9:b0:adb:1eee:a083 with SMTP id a640c23a62f3a-ae057c8b8aemr1141846566b.47.1750687499027;
        Mon, 23 Jun 2025 07:04:59 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080e28sm716407966b.73.2025.06.23.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:04:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:04:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 3/5] sys_info: add help to translate sys_info string
 to bitmap
Message-ID: <aFlfCCFZQJ9IJm-8@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-4-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-4-feng.tang@linux.alibaba.com>

On Mon 2025-06-16 09:08:38, Feng Tang wrote:
> Bitmap definition is hard to remember and decode. Add sysctl interface
> to translate human readable string like "tasks,mem,timer,lock,ftrace,..."
> to bitmap.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>  include/linux/sys_info.h |  7 +++
>  lib/sys_info.c           | 97 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
> index 79bf4a942e5f..0b49863cd414 100644
> --- a/include/linux/sys_info.h
> +++ b/include/linux/sys_info.h
> @@ -16,5 +16,12 @@
>  #define SYS_SHOW_BLOCKED_TASKS		0x00000080
>  
>  extern void sys_show_info(unsigned long info_mask);
> +extern unsigned long sys_info_parse_param(char *str);
>  
> +#ifdef CONFIG_SYSCTL
> +struct ctl_table;
> +extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> +					  void *buffer, size_t *lenp,
> +					  loff_t *ppos);
> +#endif
>  #endif	/* _LINUX_SYS_INFO_H */
> diff --git a/lib/sys_info.c b/lib/sys_info.c
> index 90a79b5164c9..9693542435ba 100644
> --- a/lib/sys_info.c
> +++ b/lib/sys_info.c
> @@ -5,6 +5,103 @@
>  #include <linux/console.h>
>  #include <linux/nmi.h>
>  
> +struct sys_info_name {
> +	unsigned long bit;
> +	const char *name;
> +};
> +
> +static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
> +
> +static const struct sys_info_name  si_names[] = {
> +	{ SYS_SHOW_TASK_INFO,	"tasks" },
> +	{ SYS_SHOW_MEM_INFO,	"mem" },
> +	{ SYS_SHOW_TIMER_INFO,	"timer" },

I see that the naming is a bit inconsistent in using singulars
vs. plurals. I suggest to use plulars when it makes sense.
It means here:

	{ SYS_SHOW_TIMERS_INFO,	"timers" },

> +	{ SYS_SHOW_LOCK_INFO,	"lock" },

and here

	{ SYS_SHOW_LOCKS_INFO,	"locks" },

> +	{ SYS_SHOW_FTRACE_INFO, "ftrace" },
> +	{ SYS_SHOW_ALL_CPU_BT,	"all_bt" },
> +	{ SYS_SHOW_BLOCKED_TASKS, "blocked_tasks" },
> +};

[...]

> +#ifdef CONFIG_SYSCTL
> +int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> +					  void *buffer, size_t *lenp,
> +					  loff_t *ppos)
> +{
> +	char names[sizeof(sys_info_avail) + 1];
> +	struct ctl_table table;
> +	unsigned long *si_bits_global;
> +	int i, ret, len;
> +
> +	si_bits_global = ro_table->data;
> +
> +	if (write) {
> +		unsigned long si_bits;
> +
> +		table = *ro_table;
> +		table.data = names;
> +		table.maxlen = sizeof(names);
> +		ret = proc_dostring(&table, write, buffer, lenp, ppos);
> +		if (ret)
> +			return ret;
> +
> +		si_bits = sys_info_parse_param(names);
> +		/*
> +		 * The access to the global value is not synchronized.
> +		 */

Nit, the comment fits on a single line. I would use:

		/* The access to the global value is not synchronized. */

> +		WRITE_ONCE(*si_bits_global, si_bits);
> +		return 0;
> +	} else {
> +		/* for 'read' operation */
> +		bool first = true;
> +		char *buf;
> +
> +		buf = names;
> +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> +			if (*si_bits_global & si_names[i].bit) {
> +
> +				if (first) {
> +					first = false;
> +				} else {
> +					*buf = ',';
> +					buf++;
> +				}
> +
> +				len = strlen(si_names[i].name);
> +				strncpy(buf, si_names[i].name, len);

I am afraid of a buffer overflow when people add new entry into
si_names[] table but they forget to update sys_info_avail[] string.
I would prefer to limit the write to the buffer by the size of the buffer.

Something like (on top of this patch):

--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -50,7 +50,7 @@ int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
 	char names[sizeof(sys_info_avail) + 1];
 	struct ctl_table table;
 	unsigned long *si_bits_global;
-	int i, ret, len;
+	int i, ret;
 
 	si_bits_global = ro_table->data;
 
@@ -72,27 +72,18 @@ int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
 		return 0;
 	} else {
 		/* for 'read' operation */
-		bool first = true;
-		char *buf;
+		char *delim = "";
+		int len = 0;
 
-		buf = names;
+		names[0] = '\0';
 		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
 			if (*si_bits_global & si_names[i].bit) {
-
-				if (first) {
-					first = false;
-				} else {
-					*buf = ',';
-					buf++;
-				}
-
-				len = strlen(si_names[i].name);
-				strncpy(buf, si_names[i].name, len);
-				buf += len;
+				len += scnprintf(names + len, sizeof(names) - len,
+						 "%s%s", delim, si_names[i].name);
+				delim = ",";
 			}
 
 		}
-		*buf = '\0';
 
 		table = *ro_table;
 		table.data = names;

Best Regards,
Petr

