Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BD2C3246;
	Thu,  5 Jun 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124192; cv=none; b=FzYt8GwQXIQR9TteLC/5LuMfZbPX60iEFhBsYyo8WxytOyGhpJCc6/Uz4H089UkEZlgNnHqa0ybQwYtpxB2ZHmgS5EOkoUIKhr3sMZbwdxwZ0xDL30BzbnzxD6kIIK/97ceC3V6LHGLeFWUqNqs246IflGU5gWo0rJ98Key1GVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124192; c=relaxed/simple;
	bh=ujLX3F0M1bsnzjnCs73IMZTAwaWP0Ob4Cnwbc1UNZzA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uQ+UjMEthp2J62ZxhFcdU+/+0jF1BmgtJNkiwmTdVNEIOCoONVEYJL0rpuSQ+nd9/zZONSqHxNpqqTlqiqcmmFrSB9wXb1HPjXVfAJ+2qTXINsgnpvHsTYvzfmoatKfQ7xuIWxOPafWL0v8eJ/8trASXFK287JxlttWDIZT6PgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lxswwcun; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxswwcun"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60657f417c4so375084eaf.0;
        Thu, 05 Jun 2025 04:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749124189; x=1749728989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yK+EprkqJf62amBLJ1Ippy6hA8ivB4RHs2NIyei16K0=;
        b=LxswwcunyJ915w+fy5t3Z1ixozf8h6Nc+0JXEGarYemO6KkQwFzjVcy8IAUjYH9arr
         Vy9W+6HL74d9nZqFHDFfc7ivqK/6wA5oepGbsoYq+6YuNr6YRwoPoccKz8VCm3lTaKHc
         zxIPuMW95YI/ckx+JlqoXsinIWVKecI6jnaJTPvx+4MzTUsVsBbsTfxaX3/jqzYSrFnj
         52MpbwHG49PRk/pgLXuiPM34qmMoKVyJnmyIoGwg5mIhBGZvFZHOKAHm86MZg74icCfq
         HFVpvDNBfeTxWhkCvyJu3bsju3lP313BVG5AsKMCRc4cxolsnChjdbzJxraokHq29CbQ
         /tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124189; x=1749728989;
        h=cc:to:subject:message-id:date:from:x-google-sender-delegation
         :sender:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yK+EprkqJf62amBLJ1Ippy6hA8ivB4RHs2NIyei16K0=;
        b=H+J7uNN+27956ke6d/qvlfT2McZ2sjSGfZRhIL4cIiWedJQC64o4XFVhG8VXV8DHB9
         QAPdSJokTJf2bVmr7SuXAkxE3UKur9LnS0UHmGE5icTn8Y9BgJ4Jxqk7XbSoyeOtCx+R
         2trzgysL5sI6jpxJ1CnXp8TL1nJYJQD/X3NSO8W/gd5XvczpV/HYygqEBx99ZQGqedyx
         RszELh3Tod/Ls8/3mHqsdwMIYPlHdTwIfA7FCXsuSxN+icZzd1vOsCHJPQsP6OoiVMPL
         LN6SxdP/CseP4tXShXsPS9aO7qKkCzcrf4JyLwWZGkXyBN2IOPhBtMk2n3QHBHIgF0aV
         iOng==
X-Forwarded-Encrypted: i=1; AJvYcCXXZYhsgHUXxVNiAtPAa5/36mFzcNMglMg5mVfazfTmMz+b1gvhwzeGbKQ8roPNMcFzAru1Oqzr26Y6sCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4q9MekUMAgj5K7T4x80BfTPB5YEpLjFNshiam+xoMGiILhfiT
	EGDnYCL/usV8AvZQQj8/4lZ9A67EwfAaSQbXytIOhm2d1pEH0OR6DnXRLc3sAPLzZza3c/XZ+qU
	nWdJkpR2XduFfFb2qSFVaAMw1zFq/9I0=
X-Gm-Gg: ASbGncto3rBORQG0yvN0lZHYGgMgHdrYKMKnQyG/D1OsAdtMZP4/qlKxxEn7XW7GnH2
	35jQUI/09kn5rKXG0qxxJE1ehqFOj3Wzin10IczfyUA/0hXYoItXwgUjMNKJMTcmgEAFvrPRAWj
	7x47DYn7hmjJ8ufVNEtgpanOnHIxVJ83A=
X-Google-Smtp-Source: AGHT+IFLYQAZbkUISB46mEThBuWvV0NryH7pH+uF3vACx34elaTajx9YgGHBG4kPga1QOFgCMdkDDinwzy5h2nd/JAo=
X-Received: by 2002:a4a:ec4a:0:b0:60b:c6c6:f69e with SMTP id
 006d021491bc7-60f0ca14c14mr3873827eaf.6.1749124189292; Thu, 05 Jun 2025
 04:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: 2045gemini@gmail.com
X-Google-Sender-Delegation: 2045gemini@gmail.com
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 5 Jun 2025 19:49:37 +0800
X-Google-Sender-Auth: UmVfVjqhnVRAOHgsC0rZ9ISmK5Y
X-Gm-Features: AX0GCFt8S0lfiw7MV3ysVd7HAe9QXxUlQIaSBz-hWFH8Qq-MfvaKDmRKgaDqkkg
Message-ID: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
Subject: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon subsystem
To: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net, 
	jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello maintainers,

I would like to report a class of pervasive Time-of-Check to
Time-of-Use (TOCTOU) bugs within the drivers/hwmon/ subsystem. These
issues can lead to various problems, including kernel panics and
incorrect hardware behavior, due to race conditions when accessing
shared data without proper synchronization.

The TOCTOU vulnerabilities stem from several common patterns:

1.  Use of macros that access contended variables multiple times
without locking.
    Many macros, such as FAN_FROM_REG, FAN_TO_REG, RPM_FROM_REG,
IN_FROM_REG, and TEMP_OFFSET_FROM_REG, access their arguments (which
are often contended variables) multiple times.
    For example, in drivers/hwmon/vt8231.c (v6.15-rc7), the fan_show
function uses FAN_FROM_REG:

    /* Fans */
    static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
    char *buf)
    {
    struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
    int nr = sensor_attr->index;
    struct vt8231_data *data = vt8231_update_device(dev);
    return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
    DIV_FROM_REG(data->fan_div[nr])));
    }

    The FAN_FROM_REG macro, typically defined as #define
FAN_FROM_REG(val, div) ((val) == 0 ? 0 : 1310720 / ((val) * (div))),
checks val for zero and then uses val in a division. If data->fan[nr]
(which becomes val) is a contended variable, it could be non-zero at
the check but modified to zero by another thread before its use in the
division, leading to a division-by-zero error.

2.  Checking and then using contended variables without locking.
    Some code paths check a contended variable and then use it,
assuming its state hasn't changed. This assumption is unsafe without
locks.
    For example, in drivers/hwmon/emc2103.c (v6.15-rc7),
fan1_input_show contains:

    static ssize_t
    fan1_input_show(struct device *dev, struct device_attribute *da, char *buf)
    {
    struct emc2103_data *data = emc2103_update_device(dev);
    int rpm = 0;
    if (data->fan_tach != 0) // Check
    rpm = (FAN_RPM_FACTOR * data->fan_multiplier) / data->fan_tach; // Use
    return sprintf(buf, "%d\n", rpm);
    }

    Here, data->fan_tach might be non-zero during the check but
changed to zero by a concurrent operation before the division, again
risking a division-by-zero.

3.  Insufficient lock scope when updating contended variables.
    In some update functions, locks are taken too late, after shared
data has already been read.
    For example, in drivers/hwmon/vt8231.c (v6.15-rc7), the
fan_div_store function reads old and calculates min before acquiring
data->update_lock:

    static ssize_t fan_div_store(struct device *dev,
         struct device_attribute *attr, const char *buf,
         size_t count)
    {
    struct vt8231_data *data = dev_get_drvdata(dev);
    struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
    unsigned long val;
    int nr = sensor_attr->index;
    // 'old' and 'min' are read/calculated from shared data before lock
    int old = vt8231_read_value(data, VT8231_REG_FANDIV);
    long min = FAN_FROM_REG(data->fan_min[nr],
    DIV_FROM_REG(data->fan_div[nr]));
    int err;

    err = kstrtoul(buf, 10, &val);
    if (err)
    return err;

    mutex_lock(&data->update_lock);
    // ... (rest of the function)
    data->fan_min[nr] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
    vt8231_write_value(data, VT8231_REG_FAN_MIN(nr), data->fan_min[nr]);
    // ...
    mutex_unlock(&data->update_lock);
    return count;
    }

    If there's contention for data->update_lock, old and min can
become stale by the time the lock is acquired. Subsequent operations
based on these stale values (e.g., calculating data->fan_min[nr]) can
lead to incorrect hardware configuration. Furthermore, the calculation
of min itself is unsynchronized and might use inconsistent
data->fan_min[nr] and data->fan_div[nr] values if another thread is
concurrently updating these fields. While Linux kernel coding style
often encourages declaring variables at the beginning of a block,
their values, if derived from shared data, should be obtained under
lock protection.

Consequences of these bugs:

Kernel Panics: Division-by-zero errors, particularly in macros like
FAN_FROM_REG, FAN_TO_REG, and RPM_FROM_REG.
Incorrect Data: For macros not involving division (e.g.,
TEMP_OFFSET_FROM_REG), TOCTOU on variable values can lead to incorrect
calculations and reporting of sensor data.
Hardware Misconfiguration: Updating hardware registers based on stale
or inconsistently read data (due to insufficient lock scope) can lead
to illegal values being written to ports.

Scope and Prevalence:

These TOCTOU issues are unfortunately widespread across the hwmon subsystem.
For instance, the FAN_FROM_REG macro pattern is found in numerous
files, including but not limited to:
adm1026.c, adm1031.c, gl518sm.c, gl520sm.c, it87.c, lm63.c, lm80.c,
lm85.c, lm87.c, max6639.c, pc87360.c, smsc47m1.c, via686a.c, vt8231.c,
w83627hf.c, w83791d.c, w83792d.c, w83l786ng.c.

Other instances of manually coded TOCTOU include functions like
fan1_input_show and fan1_target_show in drivers/hwmon/emc2103.c
(v6.15-rc7), and max6620_read in drivers/hwmon/max6620.c. I have not
been able to catalogue all instances.

Many of these bugs appear to have been introduced very early. For
example, the issues in drivers/hwmon/vt8231.c seem to date back to the
driver's introduction around kernel version 2.6.

Suggested Fixes and Discussion:

I am not certain what the most appropriate strategy for fixing these
widespread issues would be (e.g., per-file fixes or a more generalized
approach) and would appreciate your guidance. However, some potential
remediation steps include:

1.  Convert multi-access macros to inline functions: Macros like
FAN_FROM_REG that access their arguments multiple times should ideally
be converted to static inline functions. This would ensure that
arguments are evaluated only once, mitigating races related to
multiple accesses of the same underlying variable within the macro's
expansion.
2.  Expand lock scopes: For functions that update shared data, such as
fan_div_store in vt8231.c, the critical sections protected by locks
need to be carefully reviewed and potentially expanded. All reads of
shared data that are used in subsequent calculations or writes under
the lock should occur after the lock is acquired.
3.  Ensure consistent reads for multiple related variables: For read
operations involving multiple distinct but related pieces of shared
data (e.g., fan_show in vt8231.c which uses both data->fan[nr] and
data->fan_div[nr]), merely converting macros to functions might not be
sufficient if these variables can be updated non-atomically relative
to each other. Such scenarios might require acquiring a lock to ensure
a consistent snapshot of all related data is read and used.

I would like to discuss these issues further and collaborate on the
best way to address them comprehensively.

Thank you for your attention to this matter.

Best regards,
Gui-Dong Han
