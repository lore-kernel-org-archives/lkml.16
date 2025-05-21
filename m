Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01E1A317A;
	Wed, 21 May 2025 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747858730; cv=none; b=YUr94JS3OFNO+36gF8byn9jM+CXHGIAeUbLsyRSgSGJkWtGDLb22uBnoz6cnTUgj3T3agrP1DrcOpw2hYvU5RT4l9BAASQiclTqgsQZ0C/hOYhuK/60ABc7uynblNEQk/c+TcYby542uIUWZ4k2ojh1G+Fmte0qJ7T8gUJwEMUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747858730; c=relaxed/simple;
	bh=PElsn5rDHQZoxE2Yff++z2XEPctygMWdSG0eXjkrduU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDRNyn6MpPK2JSApCMJDXIlFB+CoxFfwdEUYiT6T+9/LlXoN95xAOT+dACr3OSZLSGg45FJbktKXuwz5SDbkUGpFfkEf/F+M6E+z/El3pniHdnytSjkEZbGdPS5rp6pAWOMPIjihG9qgZUQdA4jq9h6U5CSqaB+8b1unXrlrsh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1msAmiI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1msAmiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72463C4CEE4;
	Wed, 21 May 2025 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747858730;
	bh=PElsn5rDHQZoxE2Yff++z2XEPctygMWdSG0eXjkrduU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C1msAmiIIkDUx6sFNE8U7Ka41fl8Pu+/CY6O4cuHfmbuNcSmFVuLBIWENEs4RasDi
	 LvmO9x2blQUAArt6ZmJsyv01UKSBpgZpwmwofQ+Kr1hkGBgdNcOYSa6yw2bzWUirDN
	 Y8dhcWDVPZ3gArBXhHE9GWqOkcrfydhgndQm/G4G7Cdu+6KdSpD5rU2ehw4DPA8txK
	 9oN+WsFkWBhpvqdt2qQbHakE/4qSDePgdrj5CWj5dcj2WMavIozGJ9zOEXYf0tnf/u
	 00+kpKYQ3u6qq6XIVvb5dz0m08UrIAExCMzMra4yOmVzL5NlIdZBpBUYVkey2JXAIk
	 CZGdneqN6TdmQ==
Message-ID: <40b939d6-9339-444f-a2e4-3e4cd4bcb317@kernel.org>
Date: Wed, 21 May 2025 15:18:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix 10 service channel
To: Mahesh Rao <mahesh.rao@altera.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-3-fae5c45c059d@altera.com>
 <b92f2ad2-7cca-455d-af45-cfd418bf54bc@kernel.org>
 <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/25 03:42, Mahesh Rao wrote:
> 
> 
> On 19-05-2025 05:28 pm, Dinh Nguyen wrote:
>> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>>> From: Mahesh Rao <mahesh.rao@altera.com>
>>>

<snip>

>>> +
>>> +/**
>>> + * stratix10_svc_async_prepare_response - Prepare the response data 
>>> for an asynchronous transaction.
>>> + * @chan: Pointer to the service channel structure.
>>> + * @handle: Pointer to the asynchronous handler structure.
>>> + * @data: Pointer to the callback data structure.
>>> + *
>>> + * This function prepares the response data for an asynchronous 
>>> transaction. It
>>> + * extracts the response data from the SMC response structure and 
>>> stores it in
>>> + * the callback data structure. The function also logs the 
>>> completion of the
>>> + * asynchronous transaction.
>>> + *
>>> + * Return: 0 on success, -ENOENT if the command is invalid
>>> + */
>>> +static int stratix10_svc_async_prepare_response(struct 
>>> stratix10_svc_chan *chan,
>>> +                        struct stratix10_svc_async_handler *handle,
>>> +                        struct stratix10_svc_cb_data *data)
>>> +{
>>> +    struct stratix10_svc_client_msg *p_msg =
>>> +        (struct stratix10_svc_client_msg *)handle->msg;
>>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>>> +
>>> +    data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>>> +
>>> +    switch (p_msg->command) {
>>> +    default:
>>> +        dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
>>> +        return -ENOENT;
>>> +    }
>>
>> What is the above code doing?
> 
> This function prepares the response  for clients after retriving the 
> response from the Arm Trusted Firmware using the polling call. Currently 
> only the negative scenario is shown for incvalid command, the last patch 
> in series adds command for hwmon for the positive scenario.
> 

Okay, but this is confusing. Please just add this to the last patch then.



