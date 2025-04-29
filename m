Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430472BE0F7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920738; cv=none; b=AVhqvdH6JF20tLXFtc9vp4ZbGlS8++YSByH+Jh+UiXi6jzGSCURQLDegAR15JI99bBBZQ4F7QfMA3Wm/qn23uNmNCFuZHLxzMN03E10kJgJrEBNHH1Wd7fBUVMW0p5YBIFzgNwJmdRAkn504a0kawCMuQfan8Bi8aIZdTD0Bb3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920738; c=relaxed/simple;
	bh=YPTPXj7GXADEHXOMx1Z4O90ixxizjLkgmi0Dh6J7BJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AX3og9SezzmWoWMlQEUmMk7IaaaWuYJAJXbrBRU5pUHsXrTbAIc4EgkjSLqxG4u7dBT5AAXAKaADKdIKn7Y5niqo6v8jn/3Uybdc8zHDOm+YrHnShsLPnYNaGP4Jr6iNCOVPm+TJ5/fpsMUSZ2HCKOm/Mxt9y+gol7lp5hTXch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WAHjDIQw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WAHjDIQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745920734;
	bh=YPTPXj7GXADEHXOMx1Z4O90ixxizjLkgmi0Dh6J7BJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WAHjDIQwAJc3o5uxAknbJm5ETVG6FNj2CmTb9v3QxDNUMLgfs1h/Pt/ma+auHcAv0
	 YKkl3a3Uv4AGD21pLRgKMt0JBb4bGixVubdE9T2Ycme2PiS274+JonPQGDfi3NBbOX
	 EuCg7RdpbeuJgUTYYoylSZnxBFlduZhF42jBYCNMii+f6+3DVzLC1e6EWew/NjbF25
	 QglkBRm4moWj4DM0Xxea2dWm2+GPYna1uB516wz/iAUSDcutWRo7LOMjBTe1fDczAP
	 8WeBbgbtpBYFM10q3faLrDz100X6epUwmulqFqC3ZnvFnr5cYILcSgwIOHtLrmpaWw
	 cM4E50wBKGCrQ==
Received: from [192.168.1.90] (unknown [84.232.140.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA34E17E1073;
	Tue, 29 Apr 2025 11:58:53 +0200 (CEST)
Message-ID: <e54a7f29-c0a0-406a-b907-bb612d80e612@collabora.com>
Date: Tue, 29 Apr 2025 12:58:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID
 setup
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
 <87cycwy5n4.fsf@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <87cycwy5n4.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jani,

On 4/28/25 12:52 PM, Jani Nikula wrote:
> On Fri, 25 Apr 2025, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>> Factor out the HDMI connector initialization from
>> drm_kunit_helper_connector_hdmi_init_funcs() into a common
>> __connector_hdmi_init() function, while extending its functionality to
>> allow setting custom (i.e. non-default) EDID data.
>>
>> Introduce a macro as a wrapper over the new helper to allow dropping the
>> open coded EDID setup from all test cases.
>>
>> The actual conversion will be handled separately; for now just apply it
>> to drm_kunit_helper_connector_hdmi_init() helper.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
>>  1 file changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..36734639d19a3f279abc4631eb19d5c2b20ca315 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>>  
>>  static
>>  struct drm_atomic_helper_connector_hdmi_priv *
>> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>> -					   unsigned int formats,
>> -					   unsigned int max_bpc,
>> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
>> +__connector_hdmi_init(struct kunit *test,
>> +		      unsigned int formats,
>> +		      unsigned int max_bpc,
>> +		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
>> +		      const char *edid_data, size_t edid_len)
> 
> char* is weird for EDID data, but it's a pre-existing thing, and
> actually making it unsigned char or u8 isn't much better.
> 
> A follow-up could switch edid_data to just const void *, and ditto for
> set_connector_edid() and current_edid member in struct
> drm_atomic_helper_connector_hdmi_priv.

Noted for next revision (if required), otherwise I'll handle it separately.

Thanks,
Cristian
