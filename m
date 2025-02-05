Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B415F507;
	Wed,  5 Feb 2025 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774977; cv=none; b=eBZr6o/VibbFZrKUZepjYVa8uUJhYk2Rtmk+UB9079dL/ZFWbhahjE2v67U0shgB+Gd35FJ5ml131y+weqJ//MvIB+pw4PjZGx2FQ3tjLd8HxoZqRYNmgt2+6kVuspBaB/I+zfLiEy5jwq4jM/8uOiWqQrATD8lPa0gJYOlVYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774977; c=relaxed/simple;
	bh=ih4g/xIDL5kL/P4aUvXSv15rlFo7qsGhdtJgP8iuRiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MttH77sUGUNXBr0QYjsdoYChyThGhGLzRyU6G74mVdf/o5H8d2KuYoUkTUjz8sZJBRwEKb9zJSPbxyu0lTfsg++czSo6AILSKe+1NHpm/xzHJiM970AJ3wsURvs5BIetQGHGwpV8zAPcY+CJc+7yIx62lMOqSlsKeMgTe9msOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=O5oD9ajb; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="O5oD9ajb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XFjbbQfb96mUjnEi6MB0r3tlL0aDoALifBkdYK7/O4s=; b=O5oD9ajbdr7nkQfKCztxWBacw+
	mqUmnT9Ney232UamDvjTZRx0R2zFxo+12hJV66k4EvOGUQK0tCix93f7VbCb3nX8ncz9Lclt8G8aQ
	KQBcNFP5/wileELBDYjJrQEOMWLs/K3b/RwYnDvEQkRgD7a7lxly8sq+NHeoW3E8GXXL4+U7YdGOU
	C44IjPNEvnJVcKtc3Gsh6ia5vU3gxmz+ms/xEAQfZCkMOJnV1F+C5vFEx/MiyYim4U81mz/hZcp6V
	LeViwIS51jwaSczg3Y2NZFugnhwS3NVzsDERaZGNetFRJdZ5u61gP3tU8+21gS8Sy4215gSGxeMMZ
	TvFcdUeQ==;
Received: from [179.100.5.131] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tfinT-0043Na-TE; Wed, 05 Feb 2025 18:02:49 +0100
Message-ID: <f2ed50cd-a6e4-41f1-b0a3-1a4349a39ec1@igalia.com>
Date: Wed, 5 Feb 2025 14:02:44 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: cs35l41: Fallback to using HID for system_name
 if no SUB is available
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
References: <20250205164806.414020-1-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250205164806.414020-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

Em 05/02/2025 13:48, Stefan Binding escreveu:
> For systems which load firmware on the cs35l41 which use ACPI, the
> _SUB value is used to differentiate firmware and tuning files for the
> individual systems. In the case where a system does not have a _SUB
> defined in ACPI node for cs35l41, there needs to be a fallback to
> allow the files for that system to be differentiated. Since all
> ACPI nodes for cs35l41 should have a HID defined, the HID should be a
> safe option.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs35l41.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> index 07a5cab35fe1..30b89018b113 100644
> --- a/sound/soc/codecs/cs35l41.c
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -1150,19 +1150,28 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
>   
>   static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
>   {
> -	acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
> +	struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
> +	acpi_handle handle = acpi_device_handle(adev);
> +	const char *hid;

I think *hid and *sub can be in the same line.

Apart from that,

Reviewed-by: André Almeida <andrealmeid@igalia.com>
Tested-by: André Almeida <andrealmeid@igalia.com> (Steam Deck OLED)
