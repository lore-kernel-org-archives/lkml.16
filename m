Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01D15D1;
	Sun,  6 Jul 2025 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795212; cv=none; b=DVDZqqdE5yejvDnnJ8pblcXz4qRSBA5R1tmxMFikyBGFZgT14smf5pqT67JBixzfmmqw/t/wjmiOhQIeMsk22orV9pQNenrx9zpRdfpQ/80/db4Szfo5MsYZ9iAInrVI30arzvUtUZ4TRIU3FbbFjGLvXfHEpBmVJSiM/6xzIF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795212; c=relaxed/simple;
	bh=UD0oxINhjQwt/NrHWhMMC/ScI5PyAGgVVc3ZgWBJqMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iILU71p2GUmyiPdYuMMoHM8BBc9/W0u/wBCV3/Qhr+YJ1Ey8ZxyLv5lzCuWWc4bZwwBZ/VQ6u4qZinaxVezqe+9R3D2Kaitzonj4A2evMfKVLDmSd/nbAQuqx5kwckie9LFSB54e+r/ghGrKF/PeLrPPpt89aD4D4J5vbvDFOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2AICwFe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2AICwFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC91C4CEED;
	Sun,  6 Jul 2025 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795211;
	bh=UD0oxINhjQwt/NrHWhMMC/ScI5PyAGgVVc3ZgWBJqMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X2AICwFedVMu70rBWTcRm3rPAdw3Jc8sD/CJJCvsCjLpPVEhUq07svScQ/ym3VZsU
	 nqyJwGOK1hCPS7xt9hjxaC/Dwqbvuo+r53qJrE9cB+pZHs029iUA13WpbIPxjqtJnB
	 KZuwf+sRbQozxYaDzPdfJxTXYruTFc2z/33DSAl4p5Ag2eHqBFDRPcRumHkt0Xbvf4
	 gDvQ/qr0814dteUIt+C0wBlNIpy8+9gnB3fevEbsM5IbfDvqheXSdFpupTnXAth31s
	 INC9n6sX6RtOOMXhdscrL52/TlAhoMY08t8/o5IW9pdu1VHgbiT3HgRbn1cCpQgN5u
	 xOQqw5n75sjpw==
Message-ID: <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
Date: Sun, 6 Jul 2025 11:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems
 Nagami Keypad Carrier Board
To: Lukas Schmid <lukas.schmid@netcube.li>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <4994705.GXAFRqVoOG@lukas-hpz440workstation>
 <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
 <2998364.e9J7NaK4W3@lukas-hpz440workstation>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2998364.e9J7NaK4W3@lukas-hpz440workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/07/2025 11:41, Lukas Schmid wrote:
> On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
>> On 06/07/2025 11:07, Lukas Schmid wrote:
>>> On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
>>>> On 05/07/2025 23:38, Lukas Schmid wrote:
>>>>> The NetCube Systems Nagami Keypad Carrier is a custom board intended to
>>>>> fit a standard Ritto Intercom enclosure and provides a Keypad,
>>>>> NFC-Reader
>>>>> and Status-LED all controllable over Ethernet with PoE support.
>>>>>
>>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>>>>> ---
>>>>>
>>>>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
>>>>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
>>>>> 7919b5bf5..a2f16d064 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
>>>>>
>>>>> @@ -610,6 +610,12 @@ properties:
>>>>>            - const: netcube,nagami
>>>>>            - const: allwinner,sun8i-t113s
>>>>>
>>>>> +      - description: NetCube Systems Nagami Keypad Carrier Board
>>>>> +        items:
>>>>> +          - const: netcube,nagami-keypad-carrier
>>>>
>>>> That's just enum with previous entry. Don't make it over-complicated.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Just making sure here. The actual bindings are fine, but I should merge
>>> them into one patch, correct?
>>
>> No, you got two comments what should be changed in the binding.
>>
>> Best regards,
>> Krzysztof
> 
> So if I understand correctly you want me to remove the "allwinner,sun8i-t113s" 
> from the carrier boards and keep it for the SoM?
No, I spoke nothing about that compatible. My comment is EXACTLY under
the line being incorrect. That entry should have been made enum with
previous board compatible. Look at other vendors, because this file
repeats that pattern for some reason, eh...

Best regards,
Krzysztof
