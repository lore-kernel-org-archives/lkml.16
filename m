Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767422A4DB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069774; cv=none; b=ISMgzvefA38Xg5kQljEn3ZV2YtEQoFczh7kvCRAH3zqtchPGIN4bdGr6cU1wQeO2R3Y9pIvqiq4kIvs6jpD9Z+6jLVFk8dabUEQKFfpXfUCFzyWPKFwIDpDhqketGZkOeBsro0gzU1qf6zey3TT1pv1lLquC6QVZoxTUjVJcwa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069774; c=relaxed/simple;
	bh=SOz3vG7Jm/O1HWCz9lJv4YGTUeCHZOMa7Enen02WajU=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbh5agBVqQxxoVeEJIVvAYpkTk/IaQj54UBlxmc30ejkCBmxyfG1WSk7e1IH9YNAhrNOPoQLKfQslU2dzgikCR5Gb/ReErkJKAYbihL7C8beWdZm996C6Y3GqFVMnrXZiAy74PVOtreb9tXJPeMGiGKwe7hbIMHmx3hFPDss6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=L2YOGPD3; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="L2YOGPD3"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af55e518773so3097533a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1744069772; x=1744674572; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bpXYNg2Q2BZtYHIEGgpFB8yTDxvQVFgPQJVNFRPplE=;
        b=L2YOGPD3xoF/AXfVm/8F57ZnQxcmt0oLiZJ5V7dyk5yuGTj3OPnDwuthGHa0TLKg7s
         O7r11zJVapk4ksIlJ6WfltOf/hDd6eAGALsNspMr/37nrIOnJEAovbi3t1n3cQtfCTa0
         Dudj1x8uDj1SuVEPoLqvM+/7e+U57gqMb8Y8C/k4kUylao8FZRn7SyMB4eJlwD10irQp
         98Zy4JX2sTcw/wHMkqteQfo+07txxcmstwIoNgtPbFGmI2FPuNz8IL8+C1lsQZBukJtc
         ZnNhQsOdS54ZGvpdZLqUBUW6LgxegCs48w7pS+hW8CG1NUIRFlNFrsXHMwZQMRr4dhXS
         wr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744069772; x=1744674572;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bpXYNg2Q2BZtYHIEGgpFB8yTDxvQVFgPQJVNFRPplE=;
        b=vYjT9cCQMeih/v0KiNk2yynaR/q437Cq3i5xfwjHX8VRbSg4dkXyit7Pw7Y/muO8xY
         MN5sp6Wupj6aEzgbGFP2yQe3OyfLS0Vs7dZ7LQvwGXvexTLLJjhYQzoIBdymknCH3a8X
         iwgaaOYQpkYbbgHvKfGE39TJq5DB6fwWAPAPoqgqpr86/E8PU3bcy7icsms6nlu4kzJc
         7DMaL3frRNkv+7yqzwt4mqgFAOOKwMuE4IjocN8R131diOvL+gku02LM3yNkldrryylD
         uYmELQXv88F/jIiE4sfUUkaHaypanEi7IJ54Ax5veqFcLffYge9aHpJmEObr76CjMosr
         1oPA==
X-Forwarded-Encrypted: i=1; AJvYcCVC+BOCImWHTDgT8EqWK1CRuCy7gJwaWKBKhNvTJGD1Gsd0YsLnwliEyIBTZ/e+KKf0G3dyrQWvrHPSQqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKgGFdqiBmlC/lkC0++3cieU9HVvVrgIvV261qdx22XqMLM/r
	sRfKAq0skNcFTEDRQxdo0YD6YChS7SySn145M5Y4PtOzWrbDkq9lGY9PYOxKAfA=
X-Gm-Gg: ASbGncvc5lXEa3WkQZ3J4Rqzvn3M4JOsOYDYqOfXS90hUzdCX2fKsU/GWoN1h0RhB0L
	v2prIGfeqLHalV126CFSTWVvtf1+5JMulTB2Tw/L2r8TI3m1BHVn+YVF7JBN4oUpkrX4S0UBVwv
	d1h7lA5NTlZRZ+h85686Cg4nMX8ytyf6yH5y2/Vzk5RQrfy+MzOMB7IW3oWMZPPSNq+KUY8lkvU
	JS+OuzzDg7On8wIT94UOyq2hQxOH8bgLDnXRaywsSZFIKABA3yvqNIJBW2Ja/JVL9KZfieJ5ZkP
	r/IB4Jf2jrLHQTB6KXrT44qyIkVIeIjBcrPDxefnz+SCtwIXwYhjse2qcrDbb80wIUQzfn6WUZS
	EiXWTDtraog==
X-Google-Smtp-Source: AGHT+IFemBAq/3v8iYPDmDEujfCwWufabf3j8rLUdtZy/CVt2kmZmb2ogYEtZ9kEbdQwpJhlP4z6jA==
X-Received: by 2002:a17:90b:50c7:b0:2ff:71ad:e84e with SMTP id 98e67ed59e1d1-306a612c906mr20734260a91.10.1744069771670;
        Mon, 07 Apr 2025 16:49:31 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb8e2afsm9763402a91.42.2025.04.07.16.49.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Apr 2025 16:49:31 -0700 (PDT)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'srinivas pandruvada'" <srinivas.pandruvada@linux.intel.com>
Cc: "'Linux PM'" <linux-pm@vger.kernel.org>,
	"'LKML'" <linux-kernel@vger.kernel.org>,
	"'Viresh Kumar'" <viresh.kumar@linaro.org>,
	"'Mario Limonciello'" <mario.limonciello@amd.com>,
	"'Sudeep Holla'" <sudeep.holla@arm.com>,
	"Doug Smythies" <dsmythies@telus.net>,
	"'Rafael J. Wysocki'" <rjw@rjwysocki.net>,
	"'Rafael J. Wysocki'" <rafael@kernel.org>
References: <4651448.LvFx2qVVIh@rjwysocki.net>	 <8560367.NyiUUSuA9g@rjwysocki.net>	 <CAJZ5v0iMYSTnX9mkZb8aEmtbKxWOgsshNJ_AqnB9Mn27y8jzeQ@mail.gmail.com> <2362a42de1403e99a66551575efd910cc92980bc.camel@linux.intel.com>
In-Reply-To: <2362a42de1403e99a66551575efd910cc92980bc.camel@linux.intel.com>
Subject: RE: [PATCH v1 10/10] cpufreq: Pass policy pointer to ->update_limits()
Date: Mon, 7 Apr 2025 16:49:34 -0700
Message-ID: <005501dba817$b710fe60$2532fb20$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHyyTywk7Ob2ryTGJPPDQHQdNaAdgIkhChBAemkHNAByw3tNbM7zVSA
Content-Language: en-ca

On 2025.04.07 15:38 srinivas pandruvada wrote:
> On Mon, 2025-04-07 at 20:48 +0200, Rafael J. Wysocki wrote:
>> On Fri, Mar 28, 2025 at 9:49=E2=80=AFPM Rafael J. Wysocki =
<rjw@rjwysocki.net> wrote:
>>>=20
>>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>=20
>>> Since cpufreq_update_limits() obtains a cpufreq policy pointer for
>>> the
>>> given CPU and reference counts the corresponding policy object, it
>>> may
>>> as well pass the policy pointer to the cpufreq driver's -
>>> >update_limits()
>>> callback which allows that callback to avoid invoking
>>> cpufreq_cpu_get()
>>> for the same CPU.
>>>=20
>>> Accordingly, redefine ->update_limits() to take a policy pointer
>>> instead
>>> of a CPU number and update both drivers implementing it,
>>> intel_pstate
>>> and amd-pstate, as needed.
>>>=20
>>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>=20
> Hi Rafael,
>
>> Hi Srinivas,
>>=20
>> If you have any concerns regarding this patch, please let me know
>> (note that it is based on the [05/10]).
>>=20
> Changes looks fine, but wants to test out some update limits from
> interrupt path.
> Checked your branches at linux-pm, not able to locate in any branch to
> apply.
> Please point me to a branch.

Hi Srinivas,

You can get the series from patchworks [1].
Then just edit it, deleting patch 1 of 10, because that one was included =
in kernel 6.15-rc1
The rest will apply cleanly to kernel 6.15-rc1.

I just did all this in the last hour, because I wanted to check if the =
patchset fixed a years old
issue with HWP enabled, intel_cpufreq, schedutil, minimum frequency set =
above hardware
minimum was properly reflected in scaling_cur_freq  when the frequency =
was stale. [2]
The issue is not fixed.

[1] =
https://patchwork.kernel.org/project/linux-pm/patch/2315023.iZASKD2KPV@rj=
wysocki.net/
[2] =
https://lore.kernel.org/linux-pm/CAAYoRsU2=3DqOUhBKSRskcoRXSgBudWgDNVvKtJ=
A+c22cPa8EZ1Q@mail.gmail.com/


