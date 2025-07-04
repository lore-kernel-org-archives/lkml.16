Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207282C60;
	Fri,  4 Jul 2025 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640094; cv=none; b=AwX7tr2Mz3dlZs20F7AxQrAGcdhbod4jQUhUBRa8K2BERByMrjwQ2bkh4XJyU9Owm7501BOKfBDaGlITwkd1v1cu9lp+XEq6lDUpfOifiY/wo29BTPJMvFUuIGiSJngYTafPwCaghSRHZK3mA341fOtJRjLbtxFxChEmEWYCzxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640094; c=relaxed/simple;
	bh=9nbypNAho9nadol4NSOwL4uWk3u4bC94DSwgDtmfi/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQcT+cxyE90jwfc8zIzRNnVxph45ZQCsqHN0sXx6qcsPtFzZakZNP64/WlRsXCcQLATQ1/EpFDC+IPikQtWeQle4B/hB/+8Csac+9ZSfOnMoQxqDpsnLpM2SGy7bi6mOq3Hkw+cKmc6Qm3pS/Tm+UUIqdRrs8YFOZZ2LqyO/9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz+vggL1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz+vggL1"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0de1c378fso151885766b.3;
        Fri, 04 Jul 2025 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751640090; x=1752244890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iu8qZZJRCeE/RahbP7L8lz9R1hckY1KpUM97hdaH2L4=;
        b=Wz+vggL1cM7QCJ2zfy2/QEHgIT7uEV88veTSvTJuGs5PBf43rzLhXxqfjVSMTEH4qy
         wd/kAfTN7KqJm0BfY6xquO0UxFzA5rzNMUQa7NGHLWw9wV7CpGRIFBM3+9aOdsfpvGgw
         tSvfdlN/MeqYBKBayc+TFweT+EtFRxr1JKG5Mp8hxyEw0aSX5GWo1E662TIlaz/DOfsT
         cQmXddbQC0ZpOVVLvcUJNQ/+GB47kxX61GCBmZI/4yxLLtbyUN6Y3leF4hoYNrFF+/jN
         HbbYJnuUYtW8hBMZ7/URR3vliohSJJdJsZUK2vLTJYFBPd5pqJJwbWQUtAnglPFkDp8N
         UcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751640090; x=1752244890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu8qZZJRCeE/RahbP7L8lz9R1hckY1KpUM97hdaH2L4=;
        b=mJfKSO2K8syDMwgyLIG+KNkO2Ys20vAWS1++F40f0twD17p5y7t9a12abAB2dS6Y8R
         M2/sEOyE8xdsFP77DtAlcYhNpcJmN7uKkrNSVMbr9PpnFJy0Y3J1Z8W5lcBR5PDzRf3/
         Z4ygKYMwx38kQ84Jxa+areygWHdVwxDqtm7OBwa76eHLlBD9+1mISy3yIUDxRfnOEFia
         kBzOwxUSMUlXq2AK9lgws2CRZkpaPfugBb/IvHG9dFVmfb7geXu9Vvx0fuhRkPVd7lEl
         N8099npDQFw8MNXM3jx2XUMpw2eFN2zr/C5dNCrwkiE1wfpRiA/0eemGu9V/Osz9r5pV
         C0/A==
X-Forwarded-Encrypted: i=1; AJvYcCUiucWc6+hsE+s46MSunjvp8/+U8lk82LiQKxlCg5JhbWEXWPSg3IAkSVLyd2sc4/7UomLEAMV3/Cro@vger.kernel.org, AJvYcCVLgS2KJJmoIH9xt/9julVjoRwPQrY8D71q5D1nnzMvyCQcLTFl39WDzAfnCyPKlf+jOf6tgIiMt4H6m55D@vger.kernel.org
X-Gm-Message-State: AOJu0YyeRHIEM6ZeQ+QNHFNUqxEiz8cIPLr/yHlH2htkkeV1ZNhIFCnW
	IsXljjI0hOLzAa9NVD1CNuVD3kxfN8etBn62gto8c7SRFZuRr1klsCAD
X-Gm-Gg: ASbGnctfuu08x0D78XuM6vLdT2B8juVNBICshSfG3HQHYgrF4hHGpQ/Vy5LxMCkVb/u
	hKM51N0znsTqc2WnSBGizBYCkb+7VQgvznXn922A0iWlTQ+u1PTU5vW/xraAvPsS9vnpz26caD0
	s5you/LoYMvKIkTPLRjmf1Lsm8KOnADSDLarHwBNUi/JKPAokEcInBG1Axps4z05yzEsRoGmvdk
	ZGcXNsBqPLdSpvWqDcy40KqrenJ2uhnTUCeE3Da89bvqd1iuAjIxu/JEsaf07r9CzdUI/PX7HqC
	mAxVGiR4skV75f3eN3iNho2sGTGlzf7+R16nDE8UTa466O1fNOr/BjW0J6fO33ZMPjjaoTUtG+7
	riBRy07/PEIT4uQXV2lzv4+cXxqWTMP9+IB4Rep89MC1/f64A
X-Google-Smtp-Source: AGHT+IEsqn5ffeQ8ITnI7FSKA6V0dSpHAhCXvx37aUvzrskfrFtE5qmiG0tBwQAXTY4wY+dLBbE0mw==
X-Received: by 2002:a17:907:3d0c:b0:ae3:163a:f69a with SMTP id a640c23a62f3a-ae3fbd13e86mr253767466b.33.1751640089906;
        Fri, 04 Jul 2025 07:41:29 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692a6desm182883766b.42.2025.07.04.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:41:29 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: Re: [PATCH v5 2/3] eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
Date: Fri,  4 Jul 2025 14:41:28 +0000
Message-ID: <20250704144128.11341-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f14dfb9a-caf7-4889-a892-6fd61a9a5ecd@wanadoo.fr>
References: <f14dfb9a-caf7-4889-a892-6fd61a9a5ecd@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Jul 2025 16:12:56 +0200, Christophe JAILLET wrote:
> Hi, some nitpicks below, mostly related to types.
> 
> ...
> 
> > +#include <linux/i2c.h>
> > +#include <linux/regmap.h>
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/nvmem-provider.h>
> 
> Sometimes, alphabetical order is preferred.
> 
> > +
> > +#define M24LR_WRITE_TIMEOUT	  25u
> > +#define M24LR_READ_TIMEOUT	  (M24LR_WRITE_TIMEOUT)
> 
> ...
> 
> > +/**
> > + * m24lr_regmap_read - read data using regmap with retry on failure
> > + * @regmap:  regmap instance for the device
> > + * @buf:     buffer to store the read data
> > + * @size:    number of bytes to read
> > + * @offset:  starting register address
> > + *
> > + * Attempts to read a block of data from the device with retries and timeout.
> > + * Some M24LR chips may transiently NACK reads (e.g., during internal write
> > + * cycles), so this function retries with a short sleep until the timeout
> > + * expires.
> > + *
> > + * Returns:
> > + *	 Number of bytes read on success,
> > + *	 -ETIMEDOUT if the read fails within the timeout window.
> > + */
> > +static ssize_t m24lr_regmap_read(struct regmap *regmap, u8 *buf,
> > +				 size_t size, unsigned int offset)
> 
> Why returning a ssize_t?
> regmap_bulk_read() returns an int.
> 
> > +{
> > +	int err;
> > +	unsigned long timeout, read_time;
> > +	ssize_t ret = -ETIMEDOUT;
> > +
> > +	timeout = jiffies + msecs_to_jiffies(M24LR_READ_TIMEOUT);
> > +	do {
> > +		read_time = jiffies;
> > +
> > +		err = regmap_bulk_read(regmap, offset, buf, size);
> > +		if (!err) {
> > +			ret = size;
> > +			break;
> > +		}
> > +
> > +		usleep_range(1000, 2000);
> > +	} while (time_before(read_time, timeout));
> > +
> > +	return ret;
> > +}
> ...
> 
> > +static ssize_t m24lr_read(struct m24lr *m24lr, u8 *buf, size_t size,
> > +			  unsigned int offset, bool is_eeprom)
> > +{
> > +	struct regmap *regmap;
> > +	long ret;
> 
> Why long?
> m24lr_regmap_read() returns a ssize_t. (+ see comment there for why a 
> ssize_t)
> 
> (same comment applies to several places)
> 
> > +
> > +	if (is_eeprom)
> > +		regmap = m24lr->eeprom_regmap;
> > +	else
> > +		regmap = m24lr->ctl_regmap;
> > +
> > +	mutex_lock(&m24lr->lock);
> > +	ret = m24lr_regmap_read(regmap, buf, size, offset);
> > +	mutex_unlock(&m24lr->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * m24lr_write - write buffer to M24LR device with page alignment handling
> > + * @m24lr:     pointer to driver context
> > + * @buf:       data buffer to write
> > + * @size:      number of bytes to write
> > + * @offset:    target register address in the device
> > + * @is_eeprom: true if the write should target the EEPROM,
> > + *             false if it should target the system parameters sector.
> > + *
> > + * Writes data to the M24LR device using regmap, split into chunks no larger
> > + * than page_size to respect device-specific write limitations (e.g., page
> > + * size or I2C hold-time concerns). Each chunk is aligned to the page boundary
> > + * defined by page_size.
> > + *
> > + * Returns:
> > + *	 Total number of bytes written on success,
> > + *	 A negative error code if any write fails.
> > + */
> > +static ssize_t m24lr_write(struct m24lr *m24lr, const u8 *buf, size_t size,
> > +			   unsigned int offset, bool is_eeprom)
> > +{
> > +	unsigned int n, next_sector;
> > +	struct regmap *regmap;
> > +	ssize_t ret = 0;
> > +	long err;
> > +
> > +	if (is_eeprom)
> > +		regmap = m24lr->eeprom_regmap;
> > +	else
> > +		regmap = m24lr->ctl_regmap;
> > +
> > +	n = min(size, m24lr->page_size);
> 
> min_t()?
> 
> > +	next_sector = roundup(offset + 1, m24lr->page_size);
> > +	if (offset + n > next_sector)
> > +		n = next_sector - offset;
> > +
> > +	mutex_lock(&m24lr->lock);
> > +	while (n) {
> > +		err = m24lr_regmap_write(regmap, buf, n, offset);
> > +		if (IS_ERR_VALUE(err)) {
> > +			mutex_unlock(&m24lr->lock);
> > +			if (ret)
> > +				return ret;
> > +			else
> 
> Unneeded else.
> 
> > +				return err;
> > +		}
> > +
> > +		offset += n;
> > +		size -= n;
> > +		ret += n;
> > +		n = min(size, m24lr->page_size);
> 
> min_t()?
> Or change the type of page_size?
> 
> > +	}
> > +	mutex_unlock(&m24lr->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * m24lr_write_pass - Write password to M24LR043-R using secure format
> > + * @m24lr: Pointer to device control structure
> > + * @buf:   Input buffer containing hex-encoded password
> > + * @count: Number of bytes in @buf
> > + * @code:  Operation code to embed between password copies
> > + *
> > + * This function parses a 4-byte password, encodes it in  big-endian format,
> > + * and constructs a 9-byte sequence of the form:
> > + *
> > + *	  [BE(password), code, BE(password)]
> > + *
> > + * The result is written to register 0x0900 (2304), which is the password
> > + * register in M24LR04E-R chip.
> > + *
> > + * Return: Number of bytes written on success, or negative error code on failure
> > + */
> > +static ssize_t m24lr_write_pass(struct m24lr *m24lr, const char *buf,
> > +				size_t count, u8 code)
> > +{
> > +	__be32 be_pass;
> > +	u8 output[9];
> > +	long ret;
> 
> long vs ssize_t vs int.
> 
> > +	u32 pass;
> > +	int err;
> > +
> > +	if (!count)
> > +		return -EINVAL;
> > +
> > +	if (count > 8)
> > +		return -EINVAL;
> > +
> > +	err = kstrtou32(buf, 16, &pass);
> > +	if (err)
> > +		return err;
> > +
> > +	be_pass = cpu_to_be32(pass);
> > +
> > +	memcpy(output, &be_pass, sizeof(be_pass));
> > +	output[4] = code;
> > +	memcpy(output + 5, &be_pass, sizeof(be_pass));
> > +
> > +	mutex_lock(&m24lr->lock);
> > +	ret = m24lr_regmap_write(m24lr->ctl_regmap, output, 9, 2304);
> > +	mutex_unlock(&m24lr->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t m24lr_read_reg_le(struct m24lr *m24lr, u64 *val,
> > +				 unsigned int reg_addr,
> > +				 unsigned int reg_size)
> > +{
> > +	long ret;
> 
> same
> 
> > +	__le64 input = 0;
> > +
> > +	ret = m24lr_read(m24lr, (u8 *)&input, reg_size, reg_addr, false);
> > +	if (IS_ERR_VALUE(ret))
> > +		return ret;
> > +
> > +	if (ret != reg_size)
> > +		return -EINVAL;
> > +
> > +	switch (reg_size) {
> > +	case 1:
> > +		*val = *(u8 *)&input;
> > +		break;
> > +	case 2:
> > +		*val = le16_to_cpu((__le16)input);
> > +		break;
> > +	case 4:
> > +		*val = le32_to_cpu((__le32)input);
> > +		break;
> > +	case 8:
> > +		*val = le64_to_cpu((__le64)input);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	};
> > +
> > +	return 0;
> > +}
> > +
> > +static int m24lr_nvmem_read(void *priv, unsigned int offset, void *val,
> > +			    size_t bytes)
> > +{
> > +	struct m24lr *m24lr = priv;
> > +
> > +	if (!bytes)
> > +		return bytes;
> > +
> > +	if (offset + bytes > m24lr->eeprom_size)
> > +		return -EINVAL;
> > +
> > +	return m24lr_read(m24lr, val, bytes, offset, true);
> 
> We return an int now?
> 
> > +}
> 
> ...
> 
> > +static ssize_t m24lr_ctl_sss_read(struct file *filep, struct kobject *kobj,
> > +				  const struct bin_attribute *attr, char *buf,
> > +				  loff_t offset, size_t count)
> > +{
> > +	struct m24lr *m24lr = attr->private;
> > +
> > +	if (!count)
> > +		return count;
> > +
> > +	if (offset + count > m24lr->sss_len)
> 
> Does using size_add() would make sense?
> 
> > +		return -EINVAL;
> > +
> > +	return m24lr_read(m24lr, buf, count, offset, false);
> > +}
> > +
> > +static ssize_t m24lr_ctl_sss_write(struct file *filep, struct kobject *kobj,
> > +				   const struct bin_attribute *attr, char *buf,
> > +				   loff_t offset, size_t count)
> > +{
> > +	struct m24lr *m24lr = attr->private;
> > +
> > +	if (!count)
> > +		return -EINVAL;
> > +
> > +	if (offset + count > m24lr->sss_len)
> 
> Same
> 
> > +		return -EINVAL;
> > +
> > +	return m24lr_write(m24lr, buf, count, offset, false);
> > +}
> > +static BIN_ATTR(sss, 0600, m24lr_ctl_sss_read, m24lr_ctl_sss_write, 0);
> 
> ...
> 
> > +static struct attribute *m24lr_ctl_dev_attrs[] = {
> > +	&dev_attr_unlock.attr,
> > +	&dev_attr_new_pass.attr,
> > +	&dev_attr_uid.attr,
> > +	&dev_attr_total_sectors.attr,
> > +	NULL,
> 
> Unneeded trailing ,
> 
> > +};
> 
> ...
> 
> > +static int m24lr_probe(struct i2c_client *client)
> > +{
> > +	struct regmap_config eeprom_regmap_conf = {0};
> > +	struct nvmem_config nvmem_conf = {0};
> > +	struct device *dev = &client->dev;
> > +	struct i2c_client *eeprom_client;
> > +	const struct m24lr_chip *chip;
> > +	struct regmap *eeprom_regmap;
> > +	struct nvmem_device *nvmem;
> > +	struct regmap *ctl_regmap;
> > +	struct m24lr *m24lr;
> > +	u32 regs[2];
> > +	long err;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return -EOPNOTSUPP;
> > +
> > +	chip = m24lr_get_chip(dev);
> > +	if (!chip)
> > +		return -ENODEV;
> > +
> > +	m24lr = devm_kzalloc(dev, sizeof(struct m24lr), GFP_KERNEL);
> > +	if (!m24lr)
> > +		return -ENOMEM;
> > +
> > +	err = device_property_read_u32_array(dev, "reg", regs, ARRAY_SIZE(regs));
> > +	if (err) {
> > +		dev_err(dev, "device_property_read_u32_array\n");
> 
> return dev_err_probe() maybe?
> 
> > +		return err;
> > +	}
> > +	/* Create a second I2C client for the eeprom interface */
> > +	eeprom_client = devm_i2c_new_dummy_device(dev, client->adapter, regs[1]);
> > +	if (IS_ERR(eeprom_client)) {
> > +		dev_err(dev,
> > +			"Failed to create dummy I2C client for the EEPROM\n");
> 
> return dev_err_probe() maybe?
> ...
> 
> > +		return PTR_ERR(eeprom_client);
> > +	}
> > +
> > +	ctl_regmap = devm_regmap_init_i2c(client, &m24lr_ctl_regmap_conf);
> > +	if (IS_ERR(ctl_regmap)) {
> > +		err = PTR_ERR(ctl_regmap);
> > +		dev_err(dev, "Failed to init regmap\n");
> > +		return err;
> > +	}
> > +
> > +	eeprom_regmap_conf.name = "m24lr_eeprom";
> > +	eeprom_regmap_conf.reg_bits = 16;
> > +	eeprom_regmap_conf.val_bits = 8;
> > +	eeprom_regmap_conf.disable_locking = true;
> > +	eeprom_regmap_conf.max_register = chip->eeprom_size - 1;
> > +
> > +	eeprom_regmap = devm_regmap_init_i2c(eeprom_client,
> > +					     &eeprom_regmap_conf);
> > +	if (IS_ERR(eeprom_regmap)) {
> > +		err = PTR_ERR(eeprom_regmap);
> > +		dev_err(dev, "Failed to init regmap\n");
> > +		return err;
> > +	}
> > +
> > +	mutex_init(&m24lr->lock);
> > +	m24lr->sss_len = chip->sss_len;
> > +	m24lr->page_size = chip->page_size;
> > +	m24lr->eeprom_size = chip->eeprom_size;
> > +	m24lr->eeprom_regmap = eeprom_regmap;
> > +	m24lr->ctl_regmap = ctl_regmap;
> > +
> > +	nvmem_conf.dev = &eeprom_client->dev;
> > +	nvmem_conf.owner = THIS_MODULE;
> > +	nvmem_conf.type = NVMEM_TYPE_EEPROM;
> > +	nvmem_conf.reg_read = m24lr_nvmem_read;
> > +	nvmem_conf.reg_write = m24lr_nvmem_write;
> > +	nvmem_conf.size = chip->eeprom_size;
> > +	nvmem_conf.word_size = 1;
> > +	nvmem_conf.stride = 1;
> > +	nvmem_conf.priv = m24lr;
> > +
> > +	nvmem = devm_nvmem_register(dev, &nvmem_conf);
> > +	if (IS_ERR(nvmem))
> > +		return PTR_ERR(nvmem);
> > +
> > +	i2c_set_clientdata(client, m24lr);
> > +	i2c_set_clientdata(eeprom_client, m24lr);
> > +
> > +	bin_attr_sss.size = chip->sss_len;
> > +	bin_attr_sss.private = m24lr;
> > +	err = sysfs_create_bin_file(&dev->kobj, &bin_attr_sss);
> > +	if (err)
> > +		return err;
> > +
> > +	/* test by reading the uid, if success store it */
> > +	err = m24lr_read_reg_le(m24lr, &m24lr->uid, 2324, sizeof(m24lr->uid));
> > +	if (IS_ERR_VALUE(err))
> 
> Missing sysfs_remove_bin_file() or error handling pah?
> 
> > +		return -ENODEV;
> > +
> > +	return 0;
> > +}

Hi Christophe, 

Thank you for the review!

It is done.

Best regards,
Abd-Alrhman Masalkhi
