Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCBA136352
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426244; cv=none; b=q6g6ovEXzOsUK63OHBR5hMOaHk5yBFKqphdh3F3vdgupxzamMlxI924oF1m7FPJERlti4uEfXNrmzwjq5O6onfdKy9CgkY6pCuWTeoZ/YEYzL4+LEczzZTYdMyaAWUnSlgGMf6IrQipkjeb2XWzPoB7+23muD+MyQEP9jYpLCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426244; c=relaxed/simple;
	bh=JM0yFVV2gv6n/A3pkUNaiyk3zDx/Ky/NmhjO2NCizdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+rHjRlCd751xvDQdX5+qlbgczPBHOL8iwuJ7x8qAKsOpJ06MoCSNLyHltSwdlg6F9rDVRZubycyza6bPWW36hwrPYGf6jw2nHW5/0JFNVUtgDjOfyV/b9fe8wWtayp5KqVpVHIBuSBoE51Hp9fPr+sGimvZSYIY256pcKoqjFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvflLb7c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvflLb7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743426241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4culuXjcgmXNKuzg57/s8f15AmqI9BMZ7nG6QaACzLE=;
	b=NvflLb7cxX9hA1ui4fbj85+sqpMPiOkY9AB7nDUxOwEac09e7oXOwC1HX4AWUzJ1lD+gkG
	i5Pcy5CVD8MhM/Tzvh3XxOxqYO51BF1Hlt8Wsh/7WijRXUqQGHxBW2zrNNIXUcKnTXKOCU
	HLqORo2/7lQaPMT/cZ5T42ybZFzgVVk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Es6VSBCqPvmWLB9oH28sAQ-1; Mon, 31 Mar 2025 09:03:58 -0400
X-MC-Unique: Es6VSBCqPvmWLB9oH28sAQ-1
X-Mimecast-MFC-AGG-ID: Es6VSBCqPvmWLB9oH28sAQ_1743426236
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e6a340f8c7so4834020a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426236; x=1744031036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4culuXjcgmXNKuzg57/s8f15AmqI9BMZ7nG6QaACzLE=;
        b=mqwnpo01LruJ00W38xkL6vkERTtwmdYfavDBHyQ4je5TYojqAiGFsGtOrVRgWuyfDl
         LQ8Aq9ft/K0k1V6Bqqh9xLDZrA8Ur6p0WlOWdxY7NHcNq9Vnfm0izQaCYvbExI+mE+cU
         XUqdgsZ1YZjmTC4f4LHvVRMOnvrkEArq4xKNfXL1LNh61cMYxpVkgwViKjYN++4qRQJZ
         qXtZEXMpMekKOB/i/posTq6mG+lCdK88zvC//3DzPoaVz+vBwkn7+VJgLbb4y5SWa0VE
         SdRcihYh2LIIyFSIrjJfmr1PTnLY8hEM7baDt19jxjecirw1+f/AH8TGAuMYlDEOsOXm
         mgxg==
X-Forwarded-Encrypted: i=1; AJvYcCVd8Az1wfrc2Bg+kk6CJFe45/Db/aVCa8ZdzWK0uvGXumAoWNUs5omrAXs26dkEdFzYQ66+JiFmcYzF4xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr6nMUjK6643HWbvGtuK7q54bkJmYuVKqsbsa11c2gOvt72Dk4
	UlwnjH4wmcNiVBXdTYVLMG0pJPeW9fLnFoHJKjWnGidCAtLMgQsTbyAPBt7RWrSu8DC5K1nDh1T
	BiFGB2FSUKD8lgubGkygHTyUs+SdLCQbn3QP4prmXzDdZbRlecUWVTnp+vE0KmMJqjBZsHQ==
X-Gm-Gg: ASbGncuVdliypOtN10BM12g8OYrSoQSuHlR1kCrFdZklt+DsAe1qcrfY2hfBjC3j6Uj
	7GfP72G4dQ0usyHBxZgVjo9+IglsIpyObMeBdbO4sHLee3F8jQCrM6NY/EFecXAtdcHui5w67h9
	HEW6meMwMXnFjkR0tF7DTcFuDBytFn/O9P02X5jctaCAJBJiIB5HIYSsbcVDhNsGasN0njS3kSY
	fFEITQgHKeG2tUEff2sFcIVpsSWYyEW1FlQ8aqbiKuBVMMvhiyENUKJ4pu2S+RCcNPhI40+yfZA
	VQPtm9F4VVEL/1RgOgSRlQ5hLU6gl0TJ9kWPc7AX0Wkrxww+iqemmNa3cXy8L2KhGsLaxV4n+Hv
	U4nOf6qfEHtpvjYQ9TqAcfn62Z6clpPVy670u3/hnRShSwXyPo1SmhOtIdZnaRkDOjg==
X-Received: by 2002:a05:6402:2811:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5edfceacc98mr8444254a12.13.1743426235568;
        Mon, 31 Mar 2025 06:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeVVOke/LS4lE00zJMWgP3UdiPgSf/VxY+uNdgJT2WpOp2xnEI7her8oYxikVPibhMjwtDQ==
X-Received: by 2002:a05:6402:2811:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5edfceacc98mr8444194a12.13.1743426235114;
        Mon, 31 Mar 2025 06:03:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edcaac38f4sm4949440a12.10.2025.03.31.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:03:54 -0700 (PDT)
Message-ID: <d3dfe61a-1d4d-4aa6-870c-61249799e6da@redhat.com>
Date: Mon, 31 Mar 2025 15:03:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ACPI: video: Handle fetching EDID as ACPI_TYPE_PACKAGE
To: "Rafael J. Wysocki" <rafael@kernel.org>, Gergo Koteles <soyer@irl.hu>
Cc: Len Brown <lenb@kernel.org>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743195250.git.soyer@irl.hu>
 <CAJZ5v0jBONZ7UFL0HCOV=7xmnUphL_UTV=_1PnYmR6n0oN4pcg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0jBONZ7UFL0HCOV=7xmnUphL_UTV=_1PnYmR6n0oN4pcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 31-Mar-25 1:46 PM, Rafael J. Wysocki wrote:
> On Fri, Mar 28, 2025 at 10:09 PM Gergo Koteles <soyer@irl.hu> wrote:
>>
>> The _DDC method should return a buffer, or an integer in case of an error.
>> But some Lenovo laptops incorrectly return EDID as buffer in ACPI package.
>>
>> Calling _DDC generates this ACPI Warning:
>> ACPI Warning: \_SB.PCI0.GP17.VGA.LCD._DDC: Return type mismatch - \
>> found Package, expected Integer/Buffer (20240827/nspredef-254)
>>
>> Use the first element of the package to get the EDID buffer.
>>
>> The DSDT:
>>
>> Name (AUOP, Package (0x01)
>> {
>>         Buffer (0x80)
>>         {
>>         ...
>>         }
>> })
>>
>> ...
>>
>> Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
>> {
>>         If ((PAID == AUID))
>>         {
>>                 Return (AUOP) /* \_SB_.PCI0.GP17.VGA_.LCD_.AUOP */
>>         }
>>         ElseIf ((PAID == IVID))
>>         {
>>                 Return (IVOP) /* \_SB_.PCI0.GP17.VGA_.LCD_.IVOP */
>>         }
>>         ElseIf ((PAID == BOID))
>>         {
>>                 Return (BOEP) /* \_SB_.PCI0.GP17.VGA_.LCD_.BOEP */
>>         }
>>         ElseIf ((PAID == SAID))
>>         {
>>                 Return (SUNG) /* \_SB_.PCI0.GP17.VGA_.LCD_.SUNG */
>>         }
>>
>>         Return (Zero)
>> }
>>
>> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extensions/output-device-specific-methods.html#ddc-return-the-edid-for-this-device
>> Cc: stable@vger.kernel.org
>> Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4085
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>> Changes in v2:
>>  - Added comment
>>  - Improved commit message
>>  - Link to v1: https://lore.kernel.org/all/4cef341fdf7a0e877c50b502fc95ee8be28aa811.1743129387.git.soyer@irl.hu/
> 
> Hans, any concerns here?

No the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
>>  drivers/acpi/acpi_video.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
>> index efdadc74e3f4..103f29661576 100644
>> --- a/drivers/acpi/acpi_video.c
>> +++ b/drivers/acpi/acpi_video.c
>> @@ -649,6 +649,13 @@ acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length
>>
>>         obj = buffer.pointer;
>>
>> +       /*
>> +        * Some buggy implementations incorrectly return the EDID buffer in an ACPI package.
>> +        * In this case, extract the buffer from the package.
>> +        */
>> +       if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 1)
>> +               obj = &obj->package.elements[0];
>> +
>>         if (obj && obj->type == ACPI_TYPE_BUFFER) {
>>                 *edid = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
>>                 ret = *edid ? obj->buffer.length : -ENOMEM;
>> @@ -658,7 +665,7 @@ acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length
>>                 ret = -EFAULT;
>>         }
>>
>> -       kfree(obj);
>> +       kfree(buffer.pointer);
>>         return ret;
>>  }
>>
>> --
>> 2.49.0
>>
> 

