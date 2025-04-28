Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F581D63F8;
	Mon, 28 Apr 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824320; cv=none; b=q2meQNGTwbIkufty0+goSYuF785KzfZ+oerILlhwC3mno5QBCxrn8/qwMVecbEjjhUZ6wXCXracPHkb9lVlXVH6Rnk+hl+4rk9TwFSFr0ffV85W+HvC236CJj4kyagv1JyGhpAaBv+KErQXaZ4t+nS6OIJ2hWOxYqy1F8W8TS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824320; c=relaxed/simple;
	bh=eHVRbDXKY38c33YbYPTTECf5BbQnztaL3UmMw44Tt44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=si9CNue7+W/y4OHYgjhvPXAw5f/AORXkM37TIQ/DRY1zZebLcw79JiJdDfrJSnv2BU1T3iKt6+jaCK9uAqMVNMwdDPBHhBJ7q1rzU1/03IUkCBd0TjWAbTGgPX3rNMo/UL1/wdNmHj2MzqUjQ6pFQzCtwbQMo2w41VQN3gSDjYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lsw8lmeS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lsw8lmeS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c58974ed57so495407485a.2;
        Mon, 28 Apr 2025 00:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745824317; x=1746429117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eHVRbDXKY38c33YbYPTTECf5BbQnztaL3UmMw44Tt44=;
        b=Lsw8lmeSGksMYVg/lF/RT+kUMhUMTOPqlDB/Mk4UD06YuIZ62bGD4g1TfxkWBx1/az
         cKxpAam4vNleWCov20y6zOwtMF2NpH/XlQlxFjKXqerNFOxC/4nGCMj+m2WqwMspt7Mw
         yHe64GVcAi1OkJT77a3snBP+jzhJXqQEv6fCY7hnFtQUAsSkfPv7gMUmg2C6hdJ4ud5C
         CqVCkBaiTbT8MwYj25wovc8IZHhYEFFRTlCVzovGU3WWoZ1GKT0KxG1bH0BqtYOValcK
         63i/swlhsyU6Ick7DpVcsP8HoyyvtwKmBoERxSWfay6vmNyi7+ZIyfe3whGLuBOYMWpx
         exWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824317; x=1746429117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHVRbDXKY38c33YbYPTTECf5BbQnztaL3UmMw44Tt44=;
        b=phKzBPupxEK4awjluT2DYquW2l1lbnUWe+ctYgimUFifPceEdbLUkPzYqC4gITsOAg
         MpIK3OuOtLaMPHSfC9KehV9bxQs+cw2p/IiXN5ezuJlLbTpuA5kWRxBi1hIDXtcMs8YI
         K5HoRRkIdNKdFpzTu0b4W2n4tRTWjfvcQqal7oxH7tQIJfAZr9fbFu3K4M+/I0RZzulH
         vS1Ly9dg/Ny3zqrbufiiUMFhcdAy77chZhS2sJpjv8X/kLbOlf71ID1qAWw5Y/Kk/CKJ
         NRO3/Tbuvfk0fUa1lQACOh0NMcmNC31U71hkpPDrBYEf3QvDZfkXJwrOWFPxZx59cEcb
         pC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV306ndLu4Ld3k34LS6IfPCpnPL9TTTPRj1TG1eUWN2pe3VGakxPjUox+8HposYkU3yA7RqqLGb9CiDTA==@vger.kernel.org, AJvYcCWz/eyin8Ez2cWHWWiQcXP8JlCQUo6w2xI7+mq0qBls5KK89we5LTjbAPtaJlQPz6E2S1PGv3mUZeZw1VyX@vger.kernel.org
X-Gm-Message-State: AOJu0YwJfhmVycxKjayt2qAsO1tOr+9ao9pcdes1ed3eLmseAavrW3ZI
	dSfpvGLaElb0jTWY+0NwkqnrZfT+iroIlbexDhkXoCRSwLgSGh5lubpFZ6aRsnnkGQqOg0SYTfd
	W4FCExJSJlG6VzS2Cczw2h1T39HQ=
X-Gm-Gg: ASbGnct4AhMUuG0o+gMpzqE3/8hbSUirOpQFteePZ+2q4eV2bPeJHxVnV0E38NEE4/V
	hSpiyOR/hm2XQUdi//rE13Zvx1YKAmlB9hJuHyqYRnTACMLIeyOiIlLvjJ/AaCDF0UDw8fZqtZ+
	MC4FCiHPlScQrb9eKO90xuq7cyJqzTJr9j4BPPE8uJgEHgd7I2d5uudA==
X-Google-Smtp-Source: AGHT+IFGMjhnDOB+Jh/Sd7Ibapik1KwvYKBNgH00EIMQ4diYdjlZBvyLQLIPNpZSzOsmsWILBF+IOAwfbfv8vmTJuhI=
X-Received: by 2002:a05:620a:17a6:b0:7c0:be39:1a34 with SMTP id
 af79cd13be357-7c9619e841dmr1686156985a.43.1745824317544; Mon, 28 Apr 2025
 00:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200051.2410-1-a.safin@rosa.ru>
In-Reply-To: <20250425200051.2410-1-a.safin@rosa.ru>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 28 Apr 2025 09:11:45 +0200
X-Gm-Features: ATxdqUHFYkdiddYnu9pmWcmEs9oL6LQ2SO0G_nLPcU_kpOKZsy8TV6JKKeH4p2g
Message-ID: <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Alexei Safin <a.safin@rosa.ru>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 22:00, Alexei Safin <a.safin@rosa.ru> wrote:
>
> Prevent undefined behavior by adding WARN_ONCE() when find_ec_sensor_index()
> returns a negative value.

I'm not sure about WARN_ONCE, does it bring anything useful? Clients
see the error in the return value, sensor reading is absent, do we
need to duplicate that in the log? Guenter, may I leave it up to you,
please?

Best regards,
Eugene
