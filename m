Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327A218858;
	Thu, 24 Apr 2025 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527196; cv=none; b=EJnvyAmI+fLsYvBcjIIAfWYpFMNz6al9wYh+a6xASHxkRAghFNtS1NARpa32Knr2LiOarZJGSLplPkjTeXi+WpXilo7+S1y4b2F52Oop1rWaD5eJ7vFQVHpBVQAA9y0FcL3SFXlbp3mbGC1dqsSCDLTaU02pFTmBrdEsxFkZ8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527196; c=relaxed/simple;
	bh=MOaizA7/cPjk1n7GbvSqBxEZuwZ9s6/Zi44Gr3N7O58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z74AFwcrqo4Ht0QV5/y5VdRnQC34Vk2qriTvmk9eq2SLNasO5HnTCiTAtbzBDn01lawX0Xe2EtPpBGyutymL5SQi4HVLixvVmkzfmV5kFZ67zwQdbw4UD1JpcETHEH344Ptsy041x7mptk5utiPbGi0422Kz8XGqVzA6thFGxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebkcwyQ6; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebkcwyQ6"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso43801239f.1;
        Thu, 24 Apr 2025 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745527194; x=1746131994; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DIJ7hKZyuv8K+5D97GAZoWCIR3qZehsx72eh6SK2kc=;
        b=ebkcwyQ6Wnwa1WvTEZ4CyOnKkgQ/xode34lZ82URqqJbuAXAZqfF+2eNAi8nqz5V3Z
         GKTKyLn7e3At9c3nkb/E8eSHtAdWLW7f/M0Bv4OsJpCMFfKWOwkWR847HYmpIamf0R6d
         un7w8GiC5Mtce6HCfLfO3I8z3KYSLrd356Wz3xiX6/YaVTip3MF52wHQhg6qwPFsBwPA
         a82baD9PYhhREVw5SgvufJ0E8BmgKdX0Vk8g87OsoqsPSxP25i0nyNfagwKrxggueOOA
         BQRy2wk021dhiwBKjZJnCRvnnbejFIo65n7Z9s5NAhdayyoO8Bbge1FQUkaHuw9xhu5Q
         Q2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745527194; x=1746131994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DIJ7hKZyuv8K+5D97GAZoWCIR3qZehsx72eh6SK2kc=;
        b=YX+L2dzsji46+Y/uOcin6nslEEeSZEI3kGEQKYiIEGS9BL6pthcTwh5de8r53kgwQ3
         sSJ9ts4pB4EAD5Oox4kX7PRSKqohmO4WCLxkeUnL9vwCN5wAHCLVRXPmPF2p8PpDiNpu
         +5GIT11qcJEaAYqvUJApkaF/Rt+206Rw1B68ii17paoOpda91RBOXs4kliHDFi109APx
         OxjPzo5afKVRocOR+6bJYWFrf9Kl9YQoEdqHUM9xb2EzZYOQ3Ps9whxrl3vDTlA/38/4
         J7/8nSsvTNZmGKYGvbeau1CdPjKSvsa4hgjwpyWRGzsRRfCLxKtBP3blaZJRxtu3khQn
         yLGw==
X-Forwarded-Encrypted: i=1; AJvYcCU3YhOwt6zs3Fo6VsbJn4+OyqyQnyqBUL57CIwyUvdR6N7UMEk5fCWEW8m8Uc6qqSSFrEsnP0CezF5+hQ==@vger.kernel.org, AJvYcCXaPnvUHRWPQG5ZYhF0CZSWU7lvxE69mEwaMdNj42vFiEWO3LAOM7d6O/fVx+zLK562tYMNiohmLgEHImb7@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMguVFlgzRwz7FUChrt/wNaaB9jByujugyMFmZQpX19WxU+cb
	R3tI0tfbkbnefSavqWwtaR7v7AHiXVN99f4xxoE+6P3qJFI17Xi6CKFj03f+jg2jsYEnh2nHxzZ
	FEwlEW/zi8xcT7bWoGpaXNarsozQ=
X-Gm-Gg: ASbGncu3nUAu1KsdayDHsb0bc0qgCfkrHefctXsdEmhA+LBWBXzqOgoiWltISoa8x5q
	rJidN2bVXj/8aRiMolrGoug06wMLza8JdWXcOFs4emAD5A10aK+VDzF2eifYCLP3UV+ITVJUVfm
	JZQTmd5YRxcy+rq4ZuwUkCz0Jo0kj9kf7QxMLDn3OLCe0QPn7JhpPBOQ==
X-Google-Smtp-Source: AGHT+IHHS9wzkcxA+F4lJ1WAQU9GRSkd+HNkRKTeBjFi26lr9f0zQo52sz0xrFxaa5EHjk6OAfBp/Jor6Sa08C0wkx4=
X-Received: by 2002:a05:6e02:1b0a:b0:3d8:1b0b:c92b with SMTP id
 e9e14a558f8ab-3d930388f18mr49131045ab.2.1745527194328; Thu, 24 Apr 2025
 13:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424202654.5902-1-a.safin@rosa.ru>
In-Reply-To: <20250424202654.5902-1-a.safin@rosa.ru>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 24 Apr 2025 22:39:43 +0200
X-Gm-Features: ATxdqUET9zyF-iL8O7-Gzyuk4V5RBrVF1T59mNi77O4_oOHZ4zcYNqBMC05oMZs
Message-ID: <CAB95QAQ7P=sET9nxtp9OQ-kqosHXTcyBKvqwo_aDFuav=OVoEA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) check sensor index in read_string()
To: Alexei Safin <a.safin@rosa.ru>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

Hi,

maybe return the value of sensor_index, which already contains the
error code, rather than EINVAL?

Eugene

On Thu, 24 Apr 2025 at 22:27, Alexei Safin <a.safin@rosa.ru> wrote:
>
> Prevent a potential invalid memory access when the requested sensor
> is not found.
>
> find_ec_sensor_index() may return a negative value (e.g. -ENOENT),
> but its result was used without checking, which could lead to
> undefined behavior when passed to get_sensor_info().
>
> Add a proper check to return -EINVAL if sensor_index is negative.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Alexei Safin <a.safin@rosa.ru>
> ---
>  drivers/hwmon/asus-ec-sensors.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index d893cfd1cb82..769725ea18db 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -839,6 +839,10 @@ static int asus_ec_hwmon_read_string(struct device *dev,
>  {
>         struct ec_sensors_data *state = dev_get_drvdata(dev);
>         int sensor_index = find_ec_sensor_index(state, type, channel);
> +
> +       if (sensor_index < 0)
> +               return -EINVAL;
> +
>         *str = get_sensor_info(state, sensor_index)->label;
>
>         return 0;
> --
> 2.39.5 (Apple Git-154)
>
