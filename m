Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0892701D1;
	Wed, 25 Jun 2025 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840987; cv=none; b=dqrESgLyRA88n2s4cpMAo0zaQqAkrV3UCpEkkUd5CuytyRZTLDTZO9YxyuUPQ8n2j5VM5jNg4XU5YbkJ+qwBx2otZHo3knxUi6xK2a9W2goBLdU1fJtRaWF3SpQ29B6Jf6swS+AQlmL6MAYZ4R2S3mnSN0EzfFstJepGtyek3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840987; c=relaxed/simple;
	bh=0zoH2zm7ExRdSksDt2tI+GQ6Me44WT6HxaN2iHgQOEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPVYq42uqb9MtgYJvJip/HsLtvFwpQ5AAJltzv3jbx+ZRFt9kmCPfljONiZVS1rWUl7zLeJdkaz2olJy9q8/2dL3/oj2j1ux9FwR8hGXEEtC0apFkHypOcL6IGocKhgWIazAhusGsOk7Z4UW30r9bjseER4nR6hxb0OVfrA5nh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M4tI3YJ1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M4tI3YJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750840982;
	bh=0zoH2zm7ExRdSksDt2tI+GQ6Me44WT6HxaN2iHgQOEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M4tI3YJ1zR0CIBrk4xCO27LYB0a1S85PFiArrIGEdmoaThHaif+flHR6MDENc76Ly
	 D3J+8jCzJdExWzKl7wZ0MpfPUmE+QYwBk+gF7edhNkCl/wf82k1vc7mAhnXr8yM3Hw
	 aLz/kmghHoan00qcz8/biKqYy57ARpTVAY5e2I4WZ5/nYMoTUklObdamW8MO4o8odp
	 2+noA6Eti0HIUE+PGurK/zgIJLGEDO6jrn4r+tmWYIrZndG6POZyGiRENI2+lrYgGc
	 ScIwgO8MK7kI59vV0kh2DpOf9gmjj6MOjOK0wsofUooOejijHACR15xCjxLufkq0BA
	 7HceV/Y03GudQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0014F17E046C;
	Wed, 25 Jun 2025 10:43:01 +0200 (CEST)
Message-ID: <3e1f9105-4bfc-4e8b-bf18-08e7a5aaa486@collabora.com>
Date: Wed, 25 Jun 2025 10:43:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5G-s6+sF-PS0iywC5uxMkrfH1FskWG_HcHAi_tfuHWtZA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5G-s6+sF-PS0iywC5uxMkrfH1FskWG_HcHAi_tfuHWtZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 25/06/25 07:06, Chen-Yu Tsai ha scritto:
> Hi,
> 
> On Tue, Jun 24, 2025 at 3:46 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add a driver for the regulators found on all types of the MediaTek
>> MT6316 SPMI PMIC, fully controlled by SPMI interface and featuring
>> four step down DCDC (buck) converters.
>>
>> In particular, this includes support for:
>>   - MT6316(BP/VP):    2+2 Phase (Phase 1: buck1+2, Phase 2: buck3+4)
>>   - MT6316(CP/HP/KP): 3+1 Phase (Phase 1: buck1+2+4, Phase 2: buck3)
>>   - MT6316(DP/TP):    4+0 Phase (Single phase, buck1+2+3+4)
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/regulator/Kconfig            |   9 +
>>   drivers/regulator/Makefile           |   1 +
>>   drivers/regulator/mt6316-regulator.c | 345 +++++++++++++++++++++++++++
>>   3 files changed, 355 insertions(+)
>>   create mode 100644 drivers/regulator/mt6316-regulator.c
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 6d8988387da4..bca2ebbd89b7 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -864,6 +864,15 @@ config REGULATOR_MT6315
>>            This driver supports the control of different power rails of device
>>            through regulator interface.
>>
>> +config REGULATOR_MT6316
>> +       tristate "MT6316 SPMI PMIC regulator driver"
>> +       depends on SPMI || COMPILE_TEST
>> +       help
>> +          Say Y here to enable support for 2+2, 3+1 and 4 phase regulators
>> +          found in the MediaTek MT6316 BP, CP, DP, HP, VP and TP SPMI PMICs.
>> +         This driver supports the control of different power rails of device
>> +         through regulator interface.
>> +
>>   config REGULATOR_MT6323
>>          tristate "MediaTek MT6323 PMIC"
>>          depends on MFD_MT6397
>> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
>> index c0bc7a0f4e67..58643e35d2cc 100644
>> --- a/drivers/regulator/Makefile
>> +++ b/drivers/regulator/Makefile
>> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
>>   obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
>>   obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
>> +obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6323) += mt6323-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6331) += mt6331-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6332) += mt6332-regulator.o
>> diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6316-regulator.c
>> new file mode 100644
>> index 000000000000..952852bbe923
>> --- /dev/null
>> +++ b/drivers/regulator/mt6316-regulator.c
>> @@ -0,0 +1,345 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (c) 2024 MediaTek Inc.
>> +// Copyright (c) 2025 Collabora Ltd
>> +//                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/spmi.h>
>> +
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
>> +#include <linux/regulator/of_regulator.h>
>> +
>> +#define MT6316_BUCK_MODE_AUTO                  0
>> +#define MT6316_BUCK_MODE_FORCE_PWM             1
>> +#define MT6316_BUCK_MODE_LP                    2
>> +
>> +#define MT6316_CHIP_ID                         0x20b
>> +#define MT6316_BUCK_TOP_CON0                   0x1440
>> +#define EN_SET_OFFSET                          0x1
>> +#define EN_CLR_OFFSET                          0x2
>> +
>> +#define MT6316_BUCK_TOP_CON1                   0x1443
>> +
>> +#define MT6316_BUCK_TOP_ELR0                   0x1448
>> +#define MT6316_BUCK_TOP_ELR2                   0x144a
>> +#define MT6316_BUCK_TOP_ELR4                   0x144c
>> +#define MT6316_BUCK_TOP_ELR6                   0x144e
>> +#define MT6316_VSEL_MASK                       GENMASK(8, 0)
>> +
>> +#define MT6316_VBUCK1_DBG                      0x14a8
>> +#define MT6316_VBUCK2_DBG                      0x1528
>> +#define MT6316_VBUCK3_DBG                      0x15a8
>> +#define MT6316_VBUCK4_DBG                      0x1628
>> +#define MT6316_BUCK_QI                         BIT(0)
>> +
>> +#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0    0x1688
>> +#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0       0x1690
>> +
>> +enum mt6316_type {
>> +       MT6316_TYPE_2PHASE,
>> +       MT6316_TYPE_3PHASE,
>> +       MT6316_TYPE_4PHASE
>> +};
>> +
>> +/**
>> + * struct mt6316_regulator_info - MT6316 regulators information
>> + * @desc: Regulator description structure
>> + * @debug_reg: Debug register for regulator status
>> + * @lp_mode_reg: Low Power mode register (normal/idle)
>> + * @lp_mode_mask: Low Power mode regulator mask
>> + * @modeset_reg: AUTO/PWM mode register
>> + * @modeset_mask: AUTO/PWM regulator mask
>> + */
>> +struct mt6316_regulator_info {
>> +       struct regulator_desc desc;
>> +       u16 debug_reg;
>> +       u16 lp_mode_reg;
>> +       u16 lp_mode_mask;
>> +       u16 modeset_reg;
>> +       u16 modeset_mask;
>> +};
>> +
>> +#define MT6316_BUCK(match, vreg_id, min, max, step, vs_reg)            \
>> +{                                                                      \
>> +       .desc = {                                                       \
>> +               .name = match,                                          \
>> +               .of_match = of_match_ptr(match),                        \
>> +               .ops = &mt6316_vreg_setclr_ops,                         \
>> +               .type = REGULATOR_VOLTAGE,                              \
>> +               .owner = THIS_MODULE,                                   \
>> +               .n_voltages = (max - min) / step + 1,                   \
>> +               .min_uV = min,                                          \
>> +               .uV_step = step,                                        \
>> +               .enable_reg = MT6316_BUCK_TOP_CON0,                     \
>> +               .enable_mask = BIT(vreg_id - 1),                        \
>> +               .vsel_reg = vs_reg,                                     \
>> +               .vsel_mask = MT6316_VSEL_MASK,                          \
>> +               .of_map_mode = mt6316_map_mode,                         \
>> +       },                                                              \
>> +       .lp_mode_reg = MT6316_BUCK_TOP_CON1,                            \
>> +       .lp_mode_mask = BIT(vreg_id - 1),                               \
>> +       .modeset_reg = MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0,             \
>> +       .modeset_mask = BIT(vreg_id - 1),                               \
>> +       .debug_reg = MT6316_VBUCK##vreg_id##_DBG,                       \
>> +}
> 
> [...]
> 
>> +
>> +/* MT6316BP/VP - 2+2 phase buck */
>> +static struct mt6316_regulator_info mt6316bv_regulators[] = {
>> +       MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
>> +       MT6316_BUCK("vbuck34", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
> 
>                                      ^
> While this is technically correct as the selector does start from 0,
> I don't think the regulator can actually go down to 0V. In the past
> for the MT6311 / MT6315, MediaTek always added a standard minimum
> voltage in the device tree.

I believe the same, but I've done it as per what the datasheet says... so if
a zero selector is valid, the driver shall be able to set a zero selector.

The datasheet is not clear about the behavior of setting 0V -  as in, if the
buck gets its VIN and outputs nothing, or if it is the same as powering it off,
as much as not being clear about some of the electrical characteristics.

For me, there's no way to test what the 0V setting electrically does exactly,
I was only able to test that when setting that selector to zero, the platform
gets severely undervolted and crashes - but that undervolt crash happens at a
broad (substantially low) voltages range - so this particular zero setting was
.. again.. impossible to test.

> 
> I believe a combination of setting .linear_min_sel and adjusting min_uV
> and n_voltages is the correct solution.
> 

Could be, but again - if the datasheet says that this is a supported setting,
we should declare it as a supported setting.

Unless the datasheet is wrong (which is not impossible tbh) - but then what
can you do if that's the case, apart from grabbing (very) expensive equipment,
and go through that rabbit hole like that? :-(

>> +};
>> +
>> +/* MT6316CP/HP/KP - 3+1 phase buck */
>> +static struct mt6316_regulator_info mt6316chk_regulators[] = {
>> +       MT6316_BUCK("vbuck124", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
>> +       MT6316_BUCK("vbuck3", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
>> +};
>> +
>> +/* MT6316DP/TP - 4 phase buck */
>> +static struct mt6316_regulator_info mt6316dt_regulators[] = {
>> +       MT6316_BUCK("vbuck1234", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
>> +};
>> +
>> +static const struct regmap_config mt6316_spmi_regmap_config = {
>> +       .reg_bits       = 16,
>> +       .val_bits       = 8,
>> +       .max_register   = 0x1700,
>> +       .fast_io        = true,
>> +};
>> +
>> +static int mt6316_regulator_probe(struct spmi_device *sdev)
>> +{
>> +       struct regulator_config config = {};
>> +       struct mt6316_regulator_info *info;
>> +       struct regulator_dev *rdev;
>> +       enum mt6316_type type;
>> +       int num_vregs, ret;
>> +       unsigned int i;
>> +       u32 chip_id;
>> +
>> +       config.regmap = devm_regmap_init_spmi_ext(sdev, &mt6316_spmi_regmap_config);
>> +       if (IS_ERR(config.regmap))
>> +               return PTR_ERR(config.regmap);
>> +
>> +       /*
>> +        * The first read is expected to fail: this PMIC needs to be woken up
>> +        * and that can be done with any activity over the SPMI bus.
>> +        */
>> +       regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
>> +
>> +       /* The second read, instead, shall not fail! */
>> +       ret = regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
>> +       if (ret) {
>> +               dev_err(&sdev->dev, "Cannot read Chip ID!\n");
>> +               return ret;
>> +       }
>> +       dev_dbg(&sdev->dev, "Chip ID: 0x%x\n", chip_id);
>> +
>> +       config.dev = &sdev->dev;
>> +
>> +       type = (uintptr_t)device_get_match_data(&sdev->dev);
>> +       switch (type) {
>> +       case MT6316_TYPE_2PHASE:
> 
> Instead of being tied to the compatible string / PMIC variant,
> I wonder if this is something that can be read back from the
> PMIC. You wouldn't need so many variant compatible strings if
> that's the case.

We think alike - always loved that.

The answer is simple (and sad): the datasheet doesn't contain this information...
and more...: some of what you see in this driver (and the other two) is done with
a combination of cross-checking between various downstream kernels and some risky
tinkering.

Cheers,
Angelo

> 
> FWIW we do that for some of the X-Powers AXP PMICs.
> 
> 
> ChenYu


