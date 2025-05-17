Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A71F3BAC
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482848; cv=none; b=Jt8t6Rvcu/qUnR2UymyQwiJJb9ojSjUu31WkiLQKf6Luyd8HCWud35aa7nqX/GNGZyDskmltDdzD/atKY+dlPPf7c3PYBS7C9ofJ+eR3sJvhctutaxcP9RbUCEnNVZmYME4q3ZGLxqzFz8zYepxgPoCKjvrrQcxvTKtnjmDO16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482848; c=relaxed/simple;
	bh=mrtNgm9PmjqVjS9gD1LIlO+5NHzBFPAP29XyjDoDya8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEJUdN3WpmZWkdFxfj0zlSQg9FJc+w9CK9chBtRn8G6DKCqocuLuUK2U/LOX6N/speLrZmeIcEm27fWmNGOkCR8fKL1e3p/rmnz1FyU8h66tqAWqTc9H/u1XO2i7kx0sz6AQgfYnXDGZZlLzvDK4OGWump7dVwAzMCBQblg+JwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gFvj2Kex; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gFvj2Kex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hh6Lu25XTdmvKagiXZzKLzic81mSh2IPF/qRIoPuAu4=;
	b=gFvj2KexN2xWK04tBFfWYyQ15aYj9OizSc/JpuFqL0Pbs/8IBNiyZZ3Nept4Lu2Bt9NNDY
	SGn3awKGOIKyB6J1oe9pmraq44lgSjFcFALdlspD2pD1G1iAhsafZ2kh7o0/ehV3OZXA2p
	pCjVHsHZCWscf4+bB6jHDWdjFOtpCCY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-u8Fed9tJMLanpOYSd_fS_w-1; Sat, 17 May 2025 07:54:03 -0400
X-MC-Unique: u8Fed9tJMLanpOYSd_fS_w-1
X-Mimecast-MFC-AGG-ID: u8Fed9tJMLanpOYSd_fS_w_1747482843
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-44059976a1fso12478765e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 04:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747482842; x=1748087642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh6Lu25XTdmvKagiXZzKLzic81mSh2IPF/qRIoPuAu4=;
        b=VlPl+6FIcGV6bvl9EwmZrJ4xS9mxY+hAvv8IRGf4YRlCYWScKMesSxoqkKf6sJ9jwU
         FGgp1ruveDBcTPuyhuhKw53xqEy276PAKQ12rZnk9yl+jA2dOrwpVFxdvWYBzlB9Kl8L
         jXlmrg2aVEF6oO7j77pZEdPVKCirm6z7qEyZlPrTHkK53iJJLVob5ozRo3lRR8vPTPjE
         1thXtLMbJjE+OSNLtDfDhVthKbh/YQDlh41eK1+fUyJxGwQH2V73DZUnsB1o8w8Flicg
         okAFBA1rw4W0dV/SJV4Wq7NtM3qIm9NbIsQynyP+sRSny5eQa0r+wB+Buj1QBSWM+w08
         cCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi+zNhWWJzTW3jF6MVTNfXkdqtl2eY/aLHy/6rn3STE1dWve1WOPNbL1qMB5pcJ/yXtZQQeD9ihzOGSfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkeYBG1pLCUZg3JDFQ4kLeK1368vtKTtWVXQK2M2wdTdqc7ye
	Ja25QfGA38bA0RbDTbvhLS38sWUVSuKN5EZ5JWlI6unZO8rWFjZxHa/xGgDYPxEv9nijOFPXL72
	wLwVJtHeQ9DSzBaKEhDxfowedjWGrgLJDA3624O26QXz6HqkM1LmznJ1Dv6MHrt8Sbw==
X-Gm-Gg: ASbGnct/LCFxeu+KxZN3mYwttBQMFwH/l4FOvBfZ+tpinXNXyv00f8+eHiJLt6F89kC
	jOv3bMCTHygtnK7M2jRboNGyOJWgYRQJUINBvvYVK/qqQ/zoIg9Od8en/aFir8D5FESIQtIe0fp
	tqaBvLZxyixh5encOXf/xydzSOPWinHqhhGNfVMVClznRQqScBT4UWBg3vSaBlgOjf4bpSj8VAD
	GTgNpjjQfBD3GwMjzyf6pIRLj1e5xR3N+Psg/KT+MW3JXgwrX3CsRKu1oCVqG1peOdCpCnqfR/L
	SCIMHNqYDxoeiw==
X-Received: by 2002:a05:600c:c0da:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-442fe667ec9mr54443895e9.29.1747482842522;
        Sat, 17 May 2025 04:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgm8sGwtCHVVoQNRjXJMOaCVwqM6s/IUkO878URW/AoE2AM+RHZfTnFxdEzmwOe/59yA7gpw==
X-Received: by 2002:a05:600c:c0da:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-442fe667ec9mr54443825e9.29.1747482842146;
        Sat, 17 May 2025 04:54:02 -0700 (PDT)
Received: from [10.124.0.73] ([89.207.171.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59704esm68179285e9.36.2025.05.17.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:54:01 -0700 (PDT)
Message-ID: <18b8f82f-f5ea-436c-b7c8-d4182435ef05@redhat.com>
Date: Sat, 17 May 2025 13:53:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Ignore battery threshold
 change event notification
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Derek Barbosa <debarbos@redhat.com>
References: <mpearson-lenovo@squebb.ca>
 <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-May-25 04:33, Mark Pearson wrote:
> If user modifies the battery charge threshold an ACPI event is generated.
> Confirmed with Lenovo FW team this is only generated on user event. As no
> action is needed, ignore the event and prevent spurious kernel logs.
> 
> Reported-by: Derek Barbosa <debarbos@redhat.com>
> Closes: https://lore.kernel.org/platform-driver-x86/7e9a1c47-5d9c-4978-af20-3949d53fb5dc@app.fastmail.com/T/#m5f5b9ae31d3fbf30d7d9a9d76c15fb3502dfd903
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 92b21e49faf6..657625dd60a0 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -231,6 +231,7 @@ enum tpacpi_hkey_event_t {
>  	/* Thermal events */
>  	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
>  	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
> +	TP_HKEY_EV_ALARM_BAT_LIM_CHANGE	= 0x6013, /* battery charge limit changed*/
>  	TP_HKEY_EV_ALARM_SENSOR_HOT	= 0x6021, /* sensor too hot */
>  	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
>  	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* windows; thermal table changed */
> @@ -3777,6 +3778,10 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
>  		pr_alert("THERMAL EMERGENCY: battery is extremely hot!\n");
>  		/* recommended action: immediate sleep/hibernate */
>  		break;
> +	case TP_HKEY_EV_ALARM_BAT_LIM_CHANGE:
> +		pr_debug("Battery Info: battery charge threshold changed\n");
> +		/* User changed charging threshold. No action needed */
> +		return true;
>  	case TP_HKEY_EV_ALARM_SENSOR_HOT:
>  		pr_crit("THERMAL ALARM: a sensor reports something is too hot!\n");
>  		/* recommended action: warn user through gui, that */

