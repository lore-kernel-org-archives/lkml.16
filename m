Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89A36C;
	Mon, 10 Feb 2025 00:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739147489; cv=none; b=DBxvCI5SzaO47eYs3BHZvrUj2+fiPqDBqzCus+ZAF52ro9UjOjzZv3VW75WKVGFwWWhdHhIJMaQdUBQUsyFs0ce+dOJrT2Bsil4mvIViji82FEmgmIb2YZkh21/WZxRZ9ZC1JQtBgixfo4l4ipQAm3i9Y/PEMy2dvtiPTVjSCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739147489; c=relaxed/simple;
	bh=601x+SY++aJieuva0VRl0VoplR7wgszkWt++q96M3rM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GFd0i9IBvCk/nZw5HZATRERw4NkY8cElE4R3W27WVQJqWSVOziHeL4IAECfhn4mUcP5Hp+mtVAYk7cO/56M/m+h7BCVSy6/GJRCPS8Y8VkSPPdD+keTRSvRUNJ3bossDFjum2pVS//XRimAn/3Gi1ZfOnsBPoJwMS/tIHWGh6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CQHibEeO; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CQHibEeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1739147474; x=1739752274; i=w_armin@gmx.de;
	bh=Of5gT254PF8cdxR5Onf8LeOAzX4ESpG3fb6xMO+D2j8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CQHibEeObtzlZOS0MAkKXbGRlkBCUK7yY70v+9ARZYBDnrLh9qZBa/Xvdt48liy3
	 xJVJClu/C2dqk6M9qlpnzGrQXBV8T5sWFcV5Ni33zetzyvtyp7xGIyJLJQmM5Mli9
	 f51qe3QJylmE8WIb4JrxeDkxWNVD0/CVwGT3dJTFSe7tD3AUUmLzPRk6sm/41KzvM
	 zrWpbmdxx9XPLfoS62ry7zRfMG9loOLWt3X7Xvq5QctZ1ktgBSJgplVN6o2L6nLWm
	 jAd72v+sZfCnY6sW+gE2AQ0caoXNlCH8Vf4CGSuyGorSsSujGskMTBGGn8QcMkmI4
	 ReN8VuSMrlb+w5OeSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1tYWHK1j1s-00G0Ba; Mon, 10
 Feb 2025 01:31:14 +0100
Message-ID: <33eac2f8-b295-4716-a5f8-9f0bf7f6d349@gmx.de>
Date: Mon, 10 Feb 2025 01:31:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86: think-lmi: Use ACPI object when
 extracting strings
From: Armin Wolf <W_Armin@gmx.de>
To: james@equiv.tech, markpearson@lenovo.com, jorge.lopez2@hp.com
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-3-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20250203182322.384883-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:snXJDC4yv8QlN48/mIQ2AOzpIKAgbYb3qPHf0pa4pteaShD9qzA
 HjHh0mz8lqcY/DOFAZjBgAx/ypergBFTKB9EYzDD+FTZZXbZgfpuJhq6ZiYEXHFZkd/aDxk
 H/SAbtySK2LupcjMHvlU9YOvo8RQ0Fd2yPMMzmXSlAhqU57gDECmrgmyaUW29HnUbCqaAEF
 fzGUcOhIuEi11BK79O+tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dQJbAEpsxa8=;DLkb0gxcb4MADX40d9AJBAHGtBs
 oXHiCg2ele+MTkdtjxcmfQriAtCqhowKbIxM9jAeVZ3YT0lLK/EHsxt2QgUKEMFhhMIsVZM2u
 YjJU4B7FANmaWq4ym4addJSgEp1smmRLURb7VLKUqrVddqnduQT+ALzqkFn62vKhWL0dHibP5
 d4fPrpsbADZEtGxn7++nbu9//2v+bhOfNv76IsKEXACgUa5BFGT8bqVjhwerhNf2wgSuEJfqo
 Dol/QXnjYcr7Nqp/yycgzfAEV4Ns0WCcYtguErW5ab+s5cFByogLU0P0Y+4nZCzlCi+JFYlrs
 2lFu3J04D/VC7rKCTsl7ozloPQFZS3SceJIbaGNRAAtV26KnBrWLy24F4/5afCHRP5Q9DzjWn
 wsbOkLjWgjT1JmHU29fEW31VFBlq36XbGQcDeuk4J8gvkVxG54gwaAINQJ8DKHroXRw4MpJgI
 +GYV1v33UTgpuhLIEI2Zy38xo7g6ELLKF1SVpf/dsC8Ohpoz14H/ewrc8j9pE4YkMJYTmgbd6
 dXcPBtII+nxWZQy2GfHQ+tnYik4Vccbpg090pTmrDLSZAHsoiv2/MDwtOzFeKIl7HWaOPVa8+
 0a2PmYEvzPUIN6qg/Rbx9FOFIJ4ETe54xsPZ79vv16IfhnaqLDOFvl0RdjmWqXntv48R7i0+2
 TiOZI6hVcO6afMjQmmpcmZgBMRVb7t1y/0buD2rBcSaIo/hEc9A2YhyH3RL/k8+8rp5UVOk/6
 AmdxAIpVmpy0w52lDbjgLZ/+DXRJ/fkftZ9tMT1rQnnIJ78KXw1cpvzSJaAn2axzSlzd19qHV
 9pVV17r1OCVJg61+DtuHGjNzI3/9ePHlgh+GIU+mRbNk/CvrZG+gEHOmTlyKSBlb+ZviIVVVr
 n5bSdxOZFcx+DGwBszcJOmgjUgYKJBvu8PW+u+j7ACnIJ6CFwZXIykM8qdKeVv53zUE6hpdzw
 Ixc7SqgE0KH6i7HwUrAjh1/oWktcWvb/bJCdNb/cKyc9gEM6l4oWzQJL5vvWUknJ0W89qj7RF
 KbKkMkIPNP8TWSkOvTD/QDJarnWzjwdie+c/9q3zksdwZ9ejuhloti9g+VAvRJ5YbpDP82NSL
 Gd61dG94pDLRKroSYhMost2a1hEpW9sv34/Jb3OBp5CmQHWRQbomJnCFHIbDooeydTsDnjehp
 MJ5Z3kBb3HWHs1GpbbRMNlz7kUJi8OYC3+vsFl/rOwGP0pMbm2+BosNMX/ap3VpEvGWsOdquh
 6A0vWe1Fo3329DCeF0yVI1uePlGlaUkq92cci3v2ENYCLJahZLtT2qQ0iKQuOM7dumHvKWzpu
 1SwZX8Q2OO2180201t0gsTRLVFMayTeEJ16LeIWICI6jRBlukwIClPMWQiG/cO/HEyqHucHUY
 tDZ04Fxhcb4G0eFpsTz0qZdFWNEB0Gzae9ez2bnKzbFf5P1haAvobjkAuO

Am 03.02.25 um 19:23 schrieb Armin Wolf:

> Move the ACPI buffer handling out of tlmi_extract_output_string()
> and instead pass the unpacked ACPI object to prepare for future
> changes.

Hi,

i was hoping that maybe the driver maintainer could take a look at this patch
and give some feedback.

Thanks,
Armin Wolf

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/think-lmi.c | 38 +++++++++++++++++---------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 323316ac6783..2c94a4af9a1d 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -262,16 +262,11 @@ static int tlmi_simple_call(const char *guid, const char *arg)
>   	return 0;
>   }
>
> -/* Extract output string from WMI return buffer */
> -static int tlmi_extract_output_string(const struct acpi_buffer *output,
> -				      char **string)
> +/* Extract output string from WMI return value */
> +static int tlmi_extract_output_string(union acpi_object *obj, char **string)
>   {
> -	const union acpi_object *obj;
>   	char *s;
>
> -	obj = output->pointer;
> -	if (!obj)
> -		return -ENOMEM;
>   	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
>   		return -EIO;
>
> @@ -352,17 +347,21 @@ static int tlmi_opcode_setting(char *setting, const char *value)
>   static int tlmi_setting(int item, char **value, const char *guid_string)
>   {
>   	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
>   	acpi_status status;
>   	int ret;
>
>   	status = wmi_query_block(guid_string, item, &output);
> -	if (ACPI_FAILURE(status)) {
> -		kfree(output.pointer);
> +	if (ACPI_FAILURE(status))
>   		return -EIO;
> -	}
>
> -	ret = tlmi_extract_output_string(&output, value);
> -	kfree(output.pointer);
> +	obj = output.pointer;
> +	if (!obj)
> +		return -ENODATA;
> +
> +	ret = tlmi_extract_output_string(obj, value);
> +	kfree(obj);
> +
>   	return ret;
>   }
>
> @@ -370,19 +369,22 @@ static int tlmi_get_bios_selections(const char *item, char **value)
>   {
>   	const struct acpi_buffer input = { strlen(item), (char *)item };
>   	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
>   	acpi_status status;
>   	int ret;
>
>   	status = wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
>   				     0, 0, &input, &output);
> -
> -	if (ACPI_FAILURE(status)) {
> -		kfree(output.pointer);
> +	if (ACPI_FAILURE(status))
>   		return -EIO;
> -	}
>
> -	ret = tlmi_extract_output_string(&output, value);
> -	kfree(output.pointer);
> +	obj = output.pointer;
> +	if (!obj)
> +		return -ENODATA;
> +
> +	ret = tlmi_extract_output_string(obj, value);
> +	kfree(obj);
> +
>   	return ret;
>   }
>
> --
> 2.39.5
>
>
