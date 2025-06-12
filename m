Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6E2BDC34;
	Thu, 12 Jun 2025 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743280; cv=none; b=Qjwn3aBA6kvnmeHkdGCmgmoQFU3AIVaN9KeXkrwiPVZVr7h0C708fDjVM2kMN0wCJD9cNVaCsl7MFxLzNOPpCegzkvcl3JZTn6SZrFoOkxvGYUP1xFmG/YXUoBSeAIzEm0e92eltTvGwl0bEDLRKxDCc+A9sbEWxeD5MrPoq5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743280; c=relaxed/simple;
	bh=4iM7zmuPUf9/Qs9KMOpsA1dmBtwaQ4menK+lVoGxf18=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VPOLTuUhlzDFrHlsxd1s8BnywaWETM1VcR6HFuPjhlF62g4MwwHwp/myd78YRN67WboJWcmUDmozVtftIUH7HZeQFESKqrNH7EI2fH1G6L8cnUMoXbtRsKlMBmELifb85aqZhp3Avs3dPFzQcwCCS0s96ZIJeh6mxeprRgYcrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EhaVwYzy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EhaVwYzy"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0A7E020E0F;
	Thu, 12 Jun 2025 17:47:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mesmEwELGLl; Thu, 12 Jun 2025 17:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749743276; bh=4iM7zmuPUf9/Qs9KMOpsA1dmBtwaQ4menK+lVoGxf18=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EhaVwYzyKgp3gkwAQfsv5Av+wTExf9CyxeL8j5A7GT+E/MIcE6ptznsyRdBNbu+66
	 Y4GbQ/Jj6lLwIJPcO8c0LyxPe113Vmt3xStr12FIqhW6y3tJTBPE0ye+f0OvnUTcCy
	 cQC5pw1wqUNF9UzRh5a2Z+B4S/hu0BU9/TEejAYj7VhpVvoZdr2D90ViXKLPXfLIO3
	 n/s9w8Y32x8wxrXZVzG7tx2eMoz4x54I7wNLH9iSfuKc7jsQ4VmUbKi2XgDLIE+lE9
	 +JlKtFipe8c3DKMQbfrG0aypgU2KIzU8ncz8rryJLc4BRMQcgkLLvkJlnOtWxKtlpn
	 gpbYLW5acYeQA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Jun 2025 15:47:55 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
In-Reply-To: <20250612-agency-mothball-3830177fd43b@spud>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
 <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
 <20250612-agency-mothball-3830177fd43b@spud>
Message-ID: <2d8714983c484fe34313efe1dbabf2bd@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-06-12 15:32, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:09:40PM +0530, Kaustabh Chakraborty wrote:
>> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
>> Along with the MIPI-DSI panel, these devices also have an in-built LED
>> backlight device and a touchscreen, all packed together in a single chip.
>> Also, add compatibles for supported panels - TD4101 and TD4300.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/panel/synaptics,tddi.yaml     | 92 ++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d3b54f74cdf634f7fa8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml
> 
> File called synaptics,tddi
> 
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#
> 
> id of samsung,tddi
> 
> [...]
>
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - syna,td4101-panel
>> +      - syna,td4300-panel
> 
> compatibles are syna,td####-panel
> 
> These should be consistent and tooling should have complained about the
> mismatch between id and filename at the least.

Hmm, I don't recall seeing any errors. Do I pick any one then? Or is there
any other generic way?
