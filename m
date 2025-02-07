Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66880BFF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940481; cv=none; b=AgPNnkyMWF/eUw7tU7FKddz6/ipnh4yZiDZXstzwj6IBL/x1MSUkm5+qHaPqbxigXWc1EtRI9UufE44ImQWZMmy7FdPY6hladFVzlQxTJSdGmkhbrrYVtYvQwhHn2jOc5zk4gHJiAzKpeKRwoLHPTbGRpLYste5G7fSEGaVe/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940481; c=relaxed/simple;
	bh=UUjJT8Cd4U0vXwF5ZKLm9pWcEj+2y7yQHIhrqNbnu14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pMRF/Tz/iOxVUr5S1OjoqU3bSEycRYTXklFfuGsgyL3tFHryZA88ckYWVN+BsDezGgQ5OLj07/OHDBvQBlOLyCC6OFdS20IQBYIgHTqR2xPLrqyWTdmEJN7damFL3qX5BqDbG3/Q3yMygtwIGNOgI88zhEb2geXDmN6Rlfo6rVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdQI5L2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdQI5L2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B28EC4CED1;
	Fri,  7 Feb 2025 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738940480;
	bh=UUjJT8Cd4U0vXwF5ZKLm9pWcEj+2y7yQHIhrqNbnu14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TdQI5L2OzXTJ2+OyQuA9IgrVIbL2+SRWRQd8d4ByWNBYltfY+i4e8f1q476F3GAMY
	 e6vmHlUUEMoa/pDs0y7TUnId4WGnQ5k/lJTv1NSfOkn1Uryfb2cNw2SkBqwR99dx2w
	 oqyCWEa+HrCr5o/vAi7KHj++kJHqOVtbTQpv3rNMdhcUettY5cZhxpcBt/4wxFJCVO
	 eh8TPZauoA0SNb/G3Ukw+C2x2Li4stnB69Azf+gHGTGtwICpty4Mya9yJsn/BpBJl1
	 VB250DBvz8uRkgNzijnmrKlXICmzPa4VRFVLF+oyETue0KZXzdxa+4dLTMdm434Hx2
	 XVfTIM6A10S8g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
In-Reply-To: <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org> (Tudor
	Ambarus's message of "Fri, 7 Feb 2025 08:37:10 +0000")
References: <20250207081846.362919-1-linchengming884@gmail.com>
	<20250207081846.362919-2-linchengming884@gmail.com>
	<1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
Date: Fri, 07 Feb 2025 15:01:17 +0000
Message-ID: <mafs034gpztmq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07 2025, Tudor Ambarus wrote:

> Hi, Cheng,
>
> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
>> Although certain Macronix NOR flash support the Quad Input Page Program
>> feature, the corresponding information in the 4-byte Address Instruction
>> Table of these flash is not properly filled. As a result, this feature
>> cannot be enabled as expected.
>
> You need to prove that all the flashes that you touch need this fixup,
> i.e. dump their SFDP and show where's the wrong bit in the SFDP table.
>
> Identifying wrong bit in the SFDP tables would be easy to spot if we had
> a SFDP decoder. Something that we all agree that'd be a good thing to
> have, but nobody can allocate time to do it. Pratyush I remember has
> started a draft. Are you interested in introducing a SFDP decoder in
> mtd-utils?

Yes, will do. For now, you can find it here [0]. It doesn't yet support
all the tables but does have the basic ones. Feel free to give it a spin
and let me know if you find any bugs or issues.

I ran it on the SFDP for the first flash in the cover letter and this is
what it says:

    --------------------------------
    4-byte Address Instruction Table
    --------------------------------
    ID: 0xff84
    Major Version: 0x1
    Minor Version: 0x0
    Length (in bytes): 0x08
    +----------------------------------------------------------------------=
----------------------------+
    |                                             DWORD 1                  =
                            |
    +-------+--------------------------------------------------------------=
-------------------+--------+
    | Bits  | Description                                                  =
                   | Value  |
    +-------+--------------------------------------------------------------=
-------------------+--------+
    | 0     | Support for (1S-1S-1S) READ Command, Instruction=3D13h       =
                     | 0b1    |
    | 1     | Support for (1S-1S-1S) FAST_READ Command, Instruction=3D0Ch  =
                     | 0b1    |
    | 2     | Support for (1S-1S-2S) FAST_READ Command, Instruction=3D3Ch  =
                     | 0b1    |
    | 3     | Support for (1S-2S-2S) FAST_READ Command, Instruction=3DBCh  =
                     | 0b1    |
    | 4     | Support for (1S-1S-4S) FAST_READ Command, Instruction=3D6Ch  =
                     | 0b1    |
    | 5     | Support for (1S-4S-4S) FAST_READ Command, Instruction=3DECh  =
                     | 0b1    |
    | 6     | Support for (1S-1S-1S) Page Program Command, Instruction=3D12=
h                    | 0b1    |
    | 7     | Support for (1S-1S-4S) Page Program Command, Instruction=3D34=
h                    | 0b0    |
    | 8     | Support for (1S-4S-4S) Page Program Command, Instruction=3D3E=
h                    | 0b1    |
    | 9     | Support for Erase Command =E2=80=93 Type 1 size, Instruction =
lookup in next Dword       | 0b1    |
    | 10    | Support for Erase Command =E2=80=93 Type 2 size, Instruction =
lookup in next Dword       | 0b1    |
    | 11    | Support for Erase Command =E2=80=93 Type 3 size, Instruction =
lookup in next Dword       | 0b1    |
    | 12    | Support for Erase Command =E2=80=93 Type 4 size, Instruction =
lookup in next Dword       | 0b0    |
    | 13    | Support for (1S-1D-1D) DTR_Read Command, Instruction=3D0Eh   =
                     | 0b0    |
    | 14    | Support for (1S-2D-2D) DTR_Read Command, Instruction=3DBEh   =
                     | 0b0    |
    | 15    | Support for (1S-4D-4D) DTR_Read Command, Instruction=3DEEh   =
                     | 0b1    |
    | 16    | Support for volatile individual sector lock Read command, Ins=
truction=3DE0h       | 0b1    |
    | 17    | Support for volatile individual sector lock Write command, In=
struction=3DE1h      | 0b1    |
    | 18    | Support for non-volatile individual sector lock read command,=
 Instruction=3DE2h   | 0b1    |
    | 19    | Support for non-volatile individual sector lock write command=
, Instruction=3DE3h  | 0b1    |
    | 20    | Support for (1S-1S-8S) FAST_READ Command, Instruction=3D7Ch  =
                     | 0b1    |
    | 21    | Support for (1S-8S-8S) FAST_READ Command, Instruction=3DCCh  =
                     | 0b1    |
    | 22    | Support for (1S-8D-8D) DTR_READ Command, Instruction=3DFDh   =
                     | 0b1    |
    | 23    | Support for (1S-1S-8S) Page Program Command, Instruction=3D84=
h                    | 0b1    |
    | 24    | Support for (1S-8S-8S) Page Program Command, Instruction=3D8E=
h                    | 0b1    |
    | 31:25 | Reserved                                                     =
                   | 0x7f   |
    +-------+--------------------------------------------------------------=
-------------------+--------+
    +----------------------------------------------------------------------=
----------------------------+
    |                                             DWORD 2                  =
                            |
    +-------------+--------------------------------------------------------=
------------+---------------+
    | Bits        | Description                                            =
            | Value         |
    +-------------+--------------------------------------------------------=
------------+---------------+
    | 7:0         | Instruction for Erase Type 1                           =
            | 0x21          |
    | 15:8        | Instruction for Erase Type 2                           =
            | 0x5c          |
    | 23:16       | Instruction for Erase Type 3                           =
            | 0xdc          |
    | 31:24       | Instruction for Erase Type 4                           =
            | 0xff          |
    +-------------+--------------------------------------------------------=
------------+---------------+


>
> Also, if you touch all these flashes, will you please update them and
> get rid of the stray flash info fields? I'm thinking of name, size, and
> no_sfdp_flags.
>

[0] https://github.com/prati0100/parse-sfdp.git

--=20
Regards,
Pratyush Yadav
