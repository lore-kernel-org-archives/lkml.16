Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D01527B4;
	Thu,  5 Jun 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749134007; cv=none; b=sKtu2AEBeZFnDJ1+z7OIWneVItGgwdZQtZ3mVAucAeF+vXX7Plw6I5oSTDRrkzNlkl30DGvCV/CT4sYoBDF0Bt7lM5maAxBhUNXXBbFw9j/fDvhY+b7Y/UYOt8o2NR6T8jAgh+uhCp087wUYO5gvqOzeczIscBi+l99xhlY6fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749134007; c=relaxed/simple;
	bh=6zxPKgvHSUxqNVe0Ix83thKj6ebHaEy44tlg/+lYCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7rzgU5JABmBl7Dbb/BjQrgPjUMzoqKGIB27bSEX6vTKvGFiKXEhFYFJiIJtjUvBofLl0I472CzJ2/nlj1ncFxacsUDXMtF34eBQZAHkasLroUC1Q2wdK0l50ynQkB7UoGXt5F+Ghf5Us8qzf4F4AHASyA7KayXE20PdT6RxtUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5aNCzjf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5aNCzjf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ae05d224so16525935ad.1;
        Thu, 05 Jun 2025 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749134005; x=1749738805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRQIVm7bW3YjkdOh4dp4IupF84p+1l9VUm+jmJFp9Wo=;
        b=M5aNCzjfV2q7YbtbfPzf/y8tOkzDvB5XZOwdSoue3wl4M9EVw5L0IrAWu3LKHb4+IH
         REXONIfCPA1+p7BXMZSKNroLHwyW/4zNTYeYGi+ac+C12B+OQRNjHZyCnOjBE78hTIiF
         APCkWM+Es9ZLfvN8yzVrSt12ql26rVVDNwjUelDpQ2Uzr0jMXjoXdEBzkyBoj2Iesm0U
         b+qA07kZs7rHJ4VeAD/2CCUgYHQ/9xP3RoZa7vpyXlV2ItigUyBlciSywlgDkfU+967b
         yqfPOAY3nhRFrSQ7dPMzRAusGMxDYSveEs1qHe8BVn5m9H3m9hhUgPp+6Kl8h6S2LR5g
         NApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134005; x=1749738805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRQIVm7bW3YjkdOh4dp4IupF84p+1l9VUm+jmJFp9Wo=;
        b=RNK/Uj1lmcMbo/Eniyxvf9T7/dCQNA9ZSobfiYMOF3MIDZK/0DE0X84yXAb6JxOipu
         GBxHWE7eycIjv+9zRiIcW6FT3jmPoa1DWIm7OjqeJISOkaGUhqYA9P4yyA2TOz+EXAc4
         73HiWfe0V+/srG9K2cvFIpBR059DtBhxIb1OV2EDDKsP6xMGWcmsBX7F0DbQ8Uc0rHKx
         /4mbGs/YzCDACzBA/dtLi6VusI78HVugPAQ5PLEBFOle29xkj3Kz1ewXq0Hep2y4oCyw
         h3coVmc/n/57g+kjLhDKRz4iqMQB1A70QQpEcqKgcPi4TAaU0MDPMWukRDNT7umgaC8Q
         Mexg==
X-Forwarded-Encrypted: i=1; AJvYcCV98hz4GnpoDT+0Ri7Qsyvaj6jTV3GTtO4PLOXMnLvP7w0KSuRp+bJ21cd5Ixs5lo9Yq6amjOY09uNYL/HQ@vger.kernel.org, AJvYcCXljPdoF1M35VeQCNflao1dBM+WfSh0uoM5znkAD7gMkn8j7JCYXE8cwRn/75fTkBJxykf+90aajtnKHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3qjDR2WpCADRiZFvIHI99pDgcJxx2+Q4XPk89eWuHBVepScl
	cPuk3lX3698pPd0+4nlU5wfZ/DBg3j4WVyb2vK9sSxobaXh2/SC7DdTlA3Ys1EC7
X-Gm-Gg: ASbGncviC3YC9Ceq+wNUb11FnPusJnUtQF5W4F2h1Dyr6e/YnQyEdfK+RLY5nJgukdr
	tRceCV/BO+CNFUT2/uRfu5LxPXnENVZut5N6szr0hYldIByI/eDmEHJXByi8mz7A53stlrAjg9p
	LXAnX/vvRmK2e7qF2Xbf1TdrNiW+tAMCEfn4t877mt3o66AkdxgkQpPodnz9nDQdHQ+cFd/+BH/
	f0176adWKZ8+R8GWaemsjGLau7d7lwMBV/UaUlZjRtBA7VdAgFczzKazbGqIet6S6/BWSJZEV3U
	9k6lgD3Mmhrowm6+aU5oiIFVrVsthi0PT2LeC1faJyZei10UIN5eT0WrjDDo2/BkZgd+KeIMSek
	=
X-Google-Smtp-Source: AGHT+IFIap5RhCzHwAydKaMXs+LDAf3IVPmGYTXkAPcRxYXwcPhDsnb2X0Q2ZaI7J0ak5CfFPD4q/w==
X-Received: by 2002:a17:902:e741:b0:235:e94b:62dd with SMTP id d9443c01a7336-235f1436538mr57259925ad.12.1749134004434;
        Thu, 05 Jun 2025 07:33:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb396f6sm8986661a12.42.2025.06.05.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:33:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Jun 2025 07:33:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
Message-ID: <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>

On Thu, Jun 05, 2025 at 07:49:37PM +0800, Gui-Dong Han wrote:
> Hello maintainers,
> 
> I would like to report a class of pervasive Time-of-Check to
> Time-of-Use (TOCTOU) bugs within the drivers/hwmon/ subsystem. These
> issues can lead to various problems, including kernel panics and
> incorrect hardware behavior, due to race conditions when accessing
> shared data without proper synchronization.
> 
> The TOCTOU vulnerabilities stem from several common patterns:
> 
> 1.  Use of macros that access contended variables multiple times
> without locking.
>     Many macros, such as FAN_FROM_REG, FAN_TO_REG, RPM_FROM_REG,
> IN_FROM_REG, and TEMP_OFFSET_FROM_REG, access their arguments (which
> are often contended variables) multiple times.
>     For example, in drivers/hwmon/vt8231.c (v6.15-rc7), the fan_show
> function uses FAN_FROM_REG:
> 
>     /* Fans */
>     static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
>     char *buf)
>     {
>     struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>     int nr = sensor_attr->index;
>     struct vt8231_data *data = vt8231_update_device(dev);
>     return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
>     DIV_FROM_REG(data->fan_div[nr])));
>     }
> 
>     The FAN_FROM_REG macro, typically defined as #define
> FAN_FROM_REG(val, div) ((val) == 0 ? 0 : 1310720 / ((val) * (div))),
> checks val for zero and then uses val in a division. If data->fan[nr]
> (which becomes val) is a contended variable, it could be non-zero at
> the check but modified to zero by another thread before its use in the
> division, leading to a division-by-zero error.
> 
> 2.  Checking and then using contended variables without locking.
>     Some code paths check a contended variable and then use it,
> assuming its state hasn't changed. This assumption is unsafe without
> locks.
>     For example, in drivers/hwmon/emc2103.c (v6.15-rc7),
> fan1_input_show contains:
> 
>     static ssize_t
>     fan1_input_show(struct device *dev, struct device_attribute *da, char *buf)
>     {
>     struct emc2103_data *data = emc2103_update_device(dev);
>     int rpm = 0;
>     if (data->fan_tach != 0) // Check
>     rpm = (FAN_RPM_FACTOR * data->fan_multiplier) / data->fan_tach; // Use
>     return sprintf(buf, "%d\n", rpm);
>     }
> 
>     Here, data->fan_tach might be non-zero during the check but
> changed to zero by a concurrent operation before the division, again
> risking a division-by-zero.
> 
> 3.  Insufficient lock scope when updating contended variables.
>     In some update functions, locks are taken too late, after shared
> data has already been read.
>     For example, in drivers/hwmon/vt8231.c (v6.15-rc7), the
> fan_div_store function reads old and calculates min before acquiring
> data->update_lock:
> 
>     static ssize_t fan_div_store(struct device *dev,
>          struct device_attribute *attr, const char *buf,
>          size_t count)
>     {
>     struct vt8231_data *data = dev_get_drvdata(dev);
>     struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>     unsigned long val;
>     int nr = sensor_attr->index;
>     // 'old' and 'min' are read/calculated from shared data before lock
>     int old = vt8231_read_value(data, VT8231_REG_FANDIV);
>     long min = FAN_FROM_REG(data->fan_min[nr],
>     DIV_FROM_REG(data->fan_div[nr]));
>     int err;
> 
>     err = kstrtoul(buf, 10, &val);
>     if (err)
>     return err;
> 
>     mutex_lock(&data->update_lock);
>     // ... (rest of the function)
>     data->fan_min[nr] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
>     vt8231_write_value(data, VT8231_REG_FAN_MIN(nr), data->fan_min[nr]);
>     // ...
>     mutex_unlock(&data->update_lock);
>     return count;
>     }
> 
>     If there's contention for data->update_lock, old and min can
> become stale by the time the lock is acquired. Subsequent operations
> based on these stale values (e.g., calculating data->fan_min[nr]) can
> lead to incorrect hardware configuration. Furthermore, the calculation
> of min itself is unsynchronized and might use inconsistent
> data->fan_min[nr] and data->fan_div[nr] values if another thread is
> concurrently updating these fields. While Linux kernel coding style
> often encourages declaring variables at the beginning of a block,
> their values, if derived from shared data, should be obtained under
> lock protection.
> 
> Consequences of these bugs:
> 
> Kernel Panics: Division-by-zero errors, particularly in macros like
> FAN_FROM_REG, FAN_TO_REG, and RPM_FROM_REG.
> Incorrect Data: For macros not involving division (e.g.,
> TEMP_OFFSET_FROM_REG), TOCTOU on variable values can lead to incorrect
> calculations and reporting of sensor data.
> Hardware Misconfiguration: Updating hardware registers based on stale
> or inconsistently read data (due to insufficient lock scope) can lead
> to illegal values being written to ports.
> 
> Scope and Prevalence:
> 
> These TOCTOU issues are unfortunately widespread across the hwmon subsystem.
> For instance, the FAN_FROM_REG macro pattern is found in numerous
> files, including but not limited to:
> adm1026.c, adm1031.c, gl518sm.c, gl520sm.c, it87.c, lm63.c, lm80.c,
> lm85.c, lm87.c, max6639.c, pc87360.c, smsc47m1.c, via686a.c, vt8231.c,
> w83627hf.c, w83791d.c, w83792d.c, w83l786ng.c.
> 
> Other instances of manually coded TOCTOU include functions like
> fan1_input_show and fan1_target_show in drivers/hwmon/emc2103.c
> (v6.15-rc7), and max6620_read in drivers/hwmon/max6620.c. I have not
> been able to catalogue all instances.
> 
> Many of these bugs appear to have been introduced very early. For
> example, the issues in drivers/hwmon/vt8231.c seem to date back to the
> driver's introduction around kernel version 2.6.
> 
> Suggested Fixes and Discussion:
> 
> I am not certain what the most appropriate strategy for fixing these
> widespread issues would be (e.g., per-file fixes or a more generalized
> approach) and would appreciate your guidance. However, some potential
> remediation steps include:
> 
> 1.  Convert multi-access macros to inline functions: Macros like
> FAN_FROM_REG that access their arguments multiple times should ideally
> be converted to static inline functions. This would ensure that
> arguments are evaluated only once, mitigating races related to
> multiple accesses of the same underlying variable within the macro's
> expansion.
> 2.  Expand lock scopes: For functions that update shared data, such as
> fan_div_store in vt8231.c, the critical sections protected by locks
> need to be carefully reviewed and potentially expanded. All reads of
> shared data that are used in subsequent calculations or writes under
> the lock should occur after the lock is acquired.
> 3.  Ensure consistent reads for multiple related variables: For read
> operations involving multiple distinct but related pieces of shared
> data (e.g., fan_show in vt8231.c which uses both data->fan[nr] and
> data->fan_div[nr]), merely converting macros to functions might not be
> sufficient if these variables can be updated non-atomically relative
> to each other. Such scenarios might require acquiring a lock to ensure
> a consistent snapshot of all related data is read and used.
> 
> I would like to discuss these issues further and collaborate on the
> best way to address them comprehensively.
> 

I'd suggest to start submitting patches, with the goal of minimizing
the scope of changes. Sometimes that may mean expanding the scope of
locks, sometimes it may mean converting macros to functions. When
converting to functions, it doesn't have to be inline functions: I'd
leave that up to the compiler to decide. None of that code is performance
critical.

Also, it might make sense to add a note to
Documentation/hwmon/submitting-patches.rst, to "avoid calculations in
macros", explaining that this may result in the kind of problem explained
here.

Thanks,
Guenter
