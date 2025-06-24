Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA045009
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729716; cv=none; b=iyrxCnwSzb0kHAsHpxJ17XMkup753CYVS41ylkfgYPSbf+uRDcy69wudjC6o+JE9kBKvjZLQpVSXptcJa2pnrmO0d3l3/PFBdeGMvOqIsUaCxBHwKlaZgHM2q/capeCQIZlECLrdhJY32gO0SO3ziMAFrEmCUoZeQzCZeLV8aW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729716; c=relaxed/simple;
	bh=Oy2MkqCfSb1cLEOoWHoyxwCwyFD/W2voZO++JsVhu2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFkuiSaM3lAJTCtjeTyV54Bu7UQWAQehTou8p5rERU9CrXfwsk8GHaMu5VWz/NrVLvTgxEEmo6SQuA6aUPAfSR29MOMxPamFGH2njRRGeL56MRK7tgHX7vGl1cqi7od5j5YhXuDwPzxGQwVgbZVo5xpFHa9K8v3jmNm8tBtdORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VEjg1fZK; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VEjg1fZK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750729711; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=SaMsLQ2fPrrgRB+s+C8BVCgq8lpT22xxsjkVAmY/VlA=;
	b=VEjg1fZKvwXE6Mc3Hs27CVz+5LYux7jVHa2YR87yrPNdUurD8G6wfrN2Ah2ktgCUsegsrzhXXlfAhW7QlN/vfY2zibAkZOAWGuFH9ePO5k/hWp5rYojNHsyg1EM1WEdjga1+8c6yMrljDDcYwT9boU4LzLcujxn3AFBSbX3n2oQ=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wee9C9G_1750729710 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:48:31 +0800
Date: Tue, 24 Jun 2025 09:48:30 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 3/5] sys_info: add help to translate sys_info string
 to bitmap
Message-ID: <aFoD7nW-oswoZCT_@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-4-feng.tang@linux.alibaba.com>
 <aFlfCCFZQJ9IJm-8@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFlfCCFZQJ9IJm-8@pathway.suse.cz>

On Mon, Jun 23, 2025 at 04:04:56PM +0200, Petr Mladek wrote:
> On Mon 2025-06-16 09:08:38, Feng Tang wrote:
> > Bitmap definition is hard to remember and decode. Add sysctl interface
> > to translate human readable string like "tasks,mem,timer,lock,ftrace,..."
> > to bitmap.
> > 
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> >  include/linux/sys_info.h |  7 +++
> >  lib/sys_info.c           | 97 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 104 insertions(+)
> > 
> > diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
> > index 79bf4a942e5f..0b49863cd414 100644
> > --- a/include/linux/sys_info.h
> > +++ b/include/linux/sys_info.h
> > @@ -16,5 +16,12 @@
> >  #define SYS_SHOW_BLOCKED_TASKS		0x00000080
> >  
> >  extern void sys_show_info(unsigned long info_mask);
> > +extern unsigned long sys_info_parse_param(char *str);
> >  
> > +#ifdef CONFIG_SYSCTL
> > +struct ctl_table;
> > +extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> > +					  void *buffer, size_t *lenp,
> > +					  loff_t *ppos);
> > +#endif
> >  #endif	/* _LINUX_SYS_INFO_H */
> > diff --git a/lib/sys_info.c b/lib/sys_info.c
> > index 90a79b5164c9..9693542435ba 100644
> > --- a/lib/sys_info.c
> > +++ b/lib/sys_info.c
> > @@ -5,6 +5,103 @@
> >  #include <linux/console.h>
> >  #include <linux/nmi.h>
> >  
> > +struct sys_info_name {
> > +	unsigned long bit;
> > +	const char *name;
> > +};
> > +
> > +static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
> > +
> > +static const struct sys_info_name  si_names[] = {
> > +	{ SYS_SHOW_TASK_INFO,	"tasks" },
> > +	{ SYS_SHOW_MEM_INFO,	"mem" },
> > +	{ SYS_SHOW_TIMER_INFO,	"timer" },
> 
> I see that the naming is a bit inconsistent in using singulars
> vs. plurals. I suggest to use plulars when it makes sense.
> It means here:
> 
> 	{ SYS_SHOW_TIMERS_INFO,	"timers" },
> 
> > +	{ SYS_SHOW_LOCK_INFO,	"lock" },
> 
> and here
> 
> 	{ SYS_SHOW_LOCKS_INFO,	"locks" },

Will change.

> > +	{ SYS_SHOW_FTRACE_INFO, "ftrace" },
> > +	{ SYS_SHOW_ALL_CPU_BT,	"all_bt" },
> > +	{ SYS_SHOW_BLOCKED_TASKS, "blocked_tasks" },
> > +};
> 
> [...]
> 
> > +#ifdef CONFIG_SYSCTL
> > +int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> > +					  void *buffer, size_t *lenp,
> > +					  loff_t *ppos)
> > +{
> > +	char names[sizeof(sys_info_avail) + 1];
> > +	struct ctl_table table;
> > +	unsigned long *si_bits_global;
> > +	int i, ret, len;
> > +
> > +	si_bits_global = ro_table->data;
> > +
> > +	if (write) {
> > +		unsigned long si_bits;
> > +
> > +		table = *ro_table;
> > +		table.data = names;
> > +		table.maxlen = sizeof(names);
> > +		ret = proc_dostring(&table, write, buffer, lenp, ppos);
> > +		if (ret)
> > +			return ret;
> > +
> > +		si_bits = sys_info_parse_param(names);
> > +		/*
> > +		 * The access to the global value is not synchronized.
> > +		 */
> 
> Nit, the comment fits on a single line. I would use:
> 
> 		/* The access to the global value is not synchronized. */

Yes.

> > +		WRITE_ONCE(*si_bits_global, si_bits);
> > +		return 0;
> > +	} else {
> > +		/* for 'read' operation */
> > +		bool first = true;
> > +		char *buf;
> > +
> > +		buf = names;
> > +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> > +			if (*si_bits_global & si_names[i].bit) {
> > +
> > +				if (first) {
> > +					first = false;
> > +				} else {
> > +					*buf = ',';
> > +					buf++;
> > +				}
> > +
> > +				len = strlen(si_names[i].name);
> > +				strncpy(buf, si_names[i].name, len);
> 
> I am afraid of a buffer overflow when people add new entry into
> si_names[] table but they forget to update sys_info_avail[] string.
> I would prefer to limit the write to the buffer by the size of the buffer.

Indeed. In my v3 branch, I have also added a line to warn about it:

	/*
	 * When 'si_names' gets updated,  please make sure the 'sys_info_avail'
	 * below is updated accordingly.
	 */
	static const struct sys_info_name  si_names[] = {

But still, better to do some handling in code as you suggested.

> Something like (on top of this patch):
> 
> --- a/lib/sys_info.c
> +++ b/lib/sys_info.c
> @@ -50,7 +50,7 @@ int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
>  	char names[sizeof(sys_info_avail) + 1];
>  	struct ctl_table table;
>  	unsigned long *si_bits_global;
> -	int i, ret, len;
> +	int i, ret;
>  
>  	si_bits_global = ro_table->data;
>  
> @@ -72,27 +72,18 @@ int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
>  		return 0;
>  	} else {
>  		/* for 'read' operation */
> -		bool first = true;
> -		char *buf;
> +		char *delim = "";
> +		int len = 0;
>  
> -		buf = names;
> +		names[0] = '\0';
>  		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
>  			if (*si_bits_global & si_names[i].bit) {
> -
> -				if (first) {
> -					first = false;
> -				} else {
> -					*buf = ',';
> -					buf++;
> -				}
> -
> -				len = strlen(si_names[i].name);
> -				strncpy(buf, si_names[i].name, len);
> -				buf += len;
> +				len += scnprintf(names + len, sizeof(names) - len,
> +						 "%s%s", delim, si_names[i].name);
> +				delim = ",";
>  			}
>  
>  		}
> -		*buf = '\0';
>  
>  		table = *ro_table;
>  		table.data = names;

Thanks!

- Feng
 
> Best Regards,
> Petr
