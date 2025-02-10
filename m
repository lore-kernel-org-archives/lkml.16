Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4A2528E1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200641; cv=none; b=KJNtna+FTMz7Kz42s2WutZH0VqOtvBemAdofDu1fiSRD52fFBLTrOiW1CIVeMBoDeioqwx69Kva9kad8e1KFv0W8VfefypQsBbH8gdBK5fU3b78sqom1A2EUj4hG5VfmZPkydZXlhHl/dmLkwLGZDUO3v5dJSxNipkY+6uBZULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200641; c=relaxed/simple;
	bh=kCma50QUsdC4Z+7PRdKTZKVylhcHRlHz8yASiH0tgBM=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZioX9BDXYmV/e4XDxqJnbeZYDoWATRq07/pIkHEAszttZwpmFjMXwHL3exJnRiD/cmZPRwmWrM5Trob2iTKuR6o8HJRkkw0QKtmyOvHx4sgeJ113cQZFnb/D9qJmVgO5l/EEQWeaP9E0UWieiMsEh/ttCofwXv3WqavWz+PmRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=UtrP3crX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="UtrP3crX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f62cc4088so43699405ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1739200639; x=1739805439; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCma50QUsdC4Z+7PRdKTZKVylhcHRlHz8yASiH0tgBM=;
        b=UtrP3crX8v8F0fOqA/1q8B4kZfTyg61yBWedjuUJc5nAMTvDRjXRV4o2vcAGQU+zhK
         Iirzbqa+NnkE5eUqAFrd4Wa+Vdt2QksO4q5nn6V81fkA5RIBuYXxAvDMewLhdTqVpa+N
         K3Nw53x4C03Tc1k1pLtVTJF8AqY8sJptcwQHMvMA5rPoOayu7Y/3kEajs/2XETHpfdnt
         kNfq/EVskdQKEvfbkVgh4lFfAWDjhBmjivwc52AWE08dVFNDyCYpMUtog+SyQ6d7YL8P
         Ryu3uKHjYoz5E3PocrEwZYig9YFk0DZttMKROPB6LwqKTqQqyA9qr5AoOwn98M4n1xTh
         BOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200639; x=1739805439;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCma50QUsdC4Z+7PRdKTZKVylhcHRlHz8yASiH0tgBM=;
        b=GnD0gDonDxdi6Z6XOu5ja1l0u5vxGBH1crhshwEJidESLxSNpt9dIn/DByXou/z9uH
         7PT5AKCfp6JMa/3u5zNyMg0t+7YdkdNVNLHhQQPy7yv4f3GeMbxLjSx2K9CSBDdB5TP0
         ciQcEASQko1vZxmPZ7g980SCJEyN/bxKEM0kD8dfi22gmd3ErNfxiQvKiNHU/ImajkRn
         CcMFRSuOxyPyeQapgie7folhcYmoO2lIk3bLjFsRNfb6g1oUkmc+USJjcg4DnlG5hoax
         MIa7tg3VaSHtLUh87zC5U1huYXaVnub47jrjHGWehdxSOkwG55eM65YrzFwqSdWWENfM
         t0NA==
X-Gm-Message-State: AOJu0YxusE2Is0uhivuiJz63RqygWs/P9Xtfca1e3J5TxP5i+n1ReRNX
	edop6HdZYXvQKeHlPTKM03gQ1PfaHAjmykMM9STlsT4yqEhBTeq9pI++X87KNxQ=
X-Gm-Gg: ASbGncucC7ASd3sJUjOwKkTKWVn0WzUaqIyfBwvS+G3LIURpIt2COW9BL7QnyMH3o+P
	xu66KvjPndNxvf7RAakrArKIFirli+UyW97d9vKFppHhDva7fw4DlL2QtGvmNsLDcAvvYTkTODa
	YDz4VMbPGsrrnBasFHhrN2PBMlsFcvwQhJO6oelRLsj0U8bXBDCahTbiXGhUO4rYyHlG8jHbJAC
	ZNWFGftU2sCBPxNe5OwQUPQJ1Jpu/7A+qNsVEZKDDL+YC4AAGrCRTWcOdVMoy9rBE80Z0j7Ply1
	e9mQL1PdwibpGXnPa3SWo6VabDJqJ8hSVjOuTff7uIBBNCeOrDx8awpC
X-Google-Smtp-Source: AGHT+IGM38SlV4apgcWTD0J0vajemft61BNy0oB1qbcT4m94yhT137ZWkkqA/se21tSBV5kyQFSIZA==
X-Received: by 2002:a05:6a21:9211:b0:1e8:a374:ced7 with SMTP id adf61e73a8af0-1ee03a5b269mr25573812637.23.1739200639608;
        Mon, 10 Feb 2025 07:17:19 -0800 (PST)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecf47asm6624275a12.31.2025.02.10.07.17.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:17:19 -0800 (PST)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Artem Bityutskiy'" <artem.bityutskiy@linux.intel.com>
Cc: "'LKML'" <linux-kernel@vger.kernel.org>,
	"'Daniel Lezcano'" <daniel.lezcano@linaro.org>,
	"'Christian Loehle'" <christian.loehle@arm.com>,
	"'Aboorva Devarajan'" <aboorvad@linux.ibm.com>,
	"'Linux PM'" <linux-pm@vger.kernel.org>,
	"'Rafael J. Wysocki'" <rjw@rjwysocki.net>,
	"Doug Smythies" <dsmythies@telus.net>
References: <12630185.O9o76ZdvQC@rjwysocki.net>	 <009d01db79b9$aecd1c70$0c675550$@telus.net> <38fadf14318be8f3c622719cc526f7586657e0e2.camel@linux.intel.com>
In-Reply-To: <38fadf14318be8f3c622719cc526f7586657e0e2.camel@linux.intel.com>
Subject: RE: [RFT][PATCH v1] cpuidle: teo: Avoid selecting deepest idle state over-eagerly
Date: Mon, 10 Feb 2025 07:17:20 -0800
Message-ID: <000d01db7bce$e145f7a0$a3d1e6e0$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQLC2T+pvcOY0U2G0e8FLXneTSytVAF1rbSKAhISofqxVan3AA==

Hi Artem,

On 2025.02.09 01:15 : Artem Bityutskiy wrote:
> On Fri, 2025-02-07 at 15:40 -0800, Doug Smythies wrote:
>> I have only just started testing the recent idle governor changes,
>> and have not gotten very far yet.
>
> Hi Dough,
>
> there is the menu governor patch too. While it helps the server, I did not test
> it on a client system. May be you would to check it too? Subject is:
>
> [RFT][PATCH v1 0/5] cpuidle: menu: Avoid discarding useful information when processing recent idle intervals

Yes, I have included that patch set in my kernel 6.14-rc1 plus patches under test.
Other than the idle data, I don't have any other data to present yet as I have been
acquiring baseline data.


