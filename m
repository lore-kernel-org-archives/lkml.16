Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DCD35946;
	Sat, 17 May 2025 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747497647; cv=none; b=FITHdO73tged0DD17nQiKvElRC6gMdcNw6An6nWb1LVxZQZ9tI+TiLLLzhgW8xUHYKhtSefLU5979f5lEjVP6cvyn5WPu0CyMwbutZCEr8snrq5sq1/pmhqD74XgH2zVVicS05AooPgj4UXeJFNUN27o6FzDJ6p5NDu5rLKEsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747497647; c=relaxed/simple;
	bh=ktSErdggGIljgoyQTwz0CSD5tXBdfXYKrlGgt5hmDjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEMoLBXCvee4PMFhUjUaAM+79gkDtos+8/BAnugOnrD63wXablmM4XdZpmUUPBj10nBdkt9Pkx6f5945DpPB6V2gymTapMwKq8rqTSpE7xOUiPCJuFgZg5szssc7laulh3CCN+L7OpAei7/CV7mBR6YQGljCEspJcI6OmUhyPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RSOJmqq1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RSOJmqq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747497622; x=1748102422; i=w_armin@gmx.de;
	bh=fDzrVzxny7U5JS7/RlfCc46Ck69+lFLmcAcnaIbW2z0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RSOJmqq1Fvsz7AJ4DuykImYrNGUKDa8GSKhQL+TUUUseZap6oJ+S6iKwbvKjXfxy
	 YH8HS87iU+r+gihwJZjtXesHs/FBVIXsxhKxc+fm16ZpR+Zb1Da62+OGzAtR7H2iz
	 TdS2YEUTRnQiFRGH2e6SWqMfc8rlq67ATGRCGdzPOETDk/u+UfghdkkdwboVky3ZE
	 qdUC8ndK2Id4ZtMGog967t0c2GtqurbNrultEKEc2E7P0wZGmsC2ysjsYXgFYdhPQ
	 Ylqk51yk2PXxeLowgUNXifX00xUmdqQGAA6s+C8er70fGMiH3t1EcWzXaLrJY2hcv
	 PBnsz+LMYhOI4yLLJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1uvPnf3nKI-00dWaD; Sat, 17
 May 2025 18:00:22 +0200
Message-ID: <3c69bc89-f5bd-4119-ba5d-3a004e8b81fc@gmx.de>
Date: Sat, 17 May 2025 18:00:20 +0200
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
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Derek Barbosa <debarbos@redhat.com>
References: <mpearson-lenovo@squebb.ca>
 <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZFRhrHxtuzHXDMnHZ0QsCK1KLp19RHnlgnDU4flgFIzurFUOMIL
 N4HUh2F7SqF6/5saToy/QpGcP/IwVIJWaxj3/UVKFdC+m+yKwzm/LRj945RfwN8PoS1eZet
 3Lm25d5DQNmanLYaxHIKU7LPeRkfnPnxA3YIG2QIzi1LgS2Z/kGii6EdKt6cZguMHQn9L1N
 UXvtb1K9Bp37ReXLcwt/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qm0y4Atqkpw=;N2aQaiOYhg0teQKxrOqv5AjZKHU
 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

Am 17.05.25 um 04:33 schrieb Mark Pearson:

> If user modifies the battery charge threshold an ACPI event is generated.
> Confirmed with Lenovo FW team this is only generated on user event. As no
> action is needed, ignore the event and prevent spurious kernel logs.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks,
Armin Wolf

> Reported-by: Derek Barbosa <debarbos@redhat.com>
> Closes: https://lore.kernel.org/platform-driver-x86/7e9a1c47-5d9c-4978-af20-3949d53fb5dc@app.fastmail.com/T/#m5f5b9ae31d3fbf30d7d9a9d76c15fb3502dfd903
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>   drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 92b21e49faf6..657625dd60a0 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -231,6 +231,7 @@ enum tpacpi_hkey_event_t {
>   	/* Thermal events */
>   	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
>   	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
> +	TP_HKEY_EV_ALARM_BAT_LIM_CHANGE	= 0x6013, /* battery charge limit changed*/
>   	TP_HKEY_EV_ALARM_SENSOR_HOT	= 0x6021, /* sensor too hot */
>   	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
>   	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* windows; thermal table changed */
> @@ -3777,6 +3778,10 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
>   		pr_alert("THERMAL EMERGENCY: battery is extremely hot!\n");
>   		/* recommended action: immediate sleep/hibernate */
>   		break;
> +	case TP_HKEY_EV_ALARM_BAT_LIM_CHANGE:
> +		pr_debug("Battery Info: battery charge threshold changed\n");
> +		/* User changed charging threshold. No action needed */
> +		return true;
>   	case TP_HKEY_EV_ALARM_SENSOR_HOT:
>   		pr_crit("THERMAL ALARM: a sensor reports something is too hot!\n");
>   		/* recommended action: warn user through gui, that */
