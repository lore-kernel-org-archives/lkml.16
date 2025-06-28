Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44272D600
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079878; cv=none; b=MTLoKz8CU0I4BseLcRZ9rxjK/28vS1iro7UWTaSdI4SpiNpeSKsZv5F/xUGPJrgC7FIaqvjL4vs8lp2ZFwtnbNvgbE03OeAm9rGcoOx+cVRUJ4xLQrNu1X/uMlpUq7iSk08oqR/Xy5G7JS5TpuuNCiBHey7OJCWeynbseLmn0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079878; c=relaxed/simple;
	bh=e2HPA9/wexrugXoBcyL63QFmQkVRMg3Vbgzl8tLlmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TMjQScloU+CTA46NWyg0MtdqyjTCkPXkmL7+wlgQ8yg4jpSvHOgApgqUjvrJA5jgfBWU1S9av5uponsENJHyI1kIZNpcSDFOkbfNEWJOvlKhhZpKlOhAp1L+AVOlYIgGAJG9mugC1jkbshppLzJZWZi2g2FhUPjoMF46YHJC7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnQflVhU; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnQflVhU"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-735a6d7c5b1so1460743a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751079876; x=1751684676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mrEXq+k4C9jjEUBgclh5S8eupzCvj0cpocVaBAvBRg=;
        b=tnQflVhUt/ZBOx/nmfoy83EAHMOMjCpgtl11HXZPOy20rtAS2d+8nTD1YEGiP4Mok+
         vaNZQzePVRu9z7Y0tEHvbnNL3Gj2EGwYOcayIJd9soYDOQ8pj0mkoOW6y80/6UF8d/Bg
         6d5u3DGxhK8evRX4AubW87AO6wZ5wgYOein8Y7yX8PviySzYJXk5IL6eWw7pldoWeq/q
         aPAXltqpa/aHEHngdEtwUCM26BnBFBNEfXGjl5TSSvMYaFdGzXgOXserAXfH67rHsogd
         5Ylrx1/Ww5mrN6cfMOTB7gdx0YFXkLf2c3sQWBq3dAnz+V9xSFfLG7KLaNR8S/NVpsvL
         eWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079876; x=1751684676;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mrEXq+k4C9jjEUBgclh5S8eupzCvj0cpocVaBAvBRg=;
        b=fpLv/PjkekpLOUianTiOBVNtu0uAC6u1/mRneZauFCIe8MnrZYMwkdXH2/79x5+LtD
         ah9/DaMQji8OOV9XyJRQBiNszSk05pPvN3HwUckxkdBvnjRe5pTiNgyYl1SrDIP5IKz6
         gNhnbZuNjWYuWlU1II3SfuT+ToPYAcKdeSdHlUKOX3KWLE8ykWHexijcI+PSUhonCefB
         KVndKRxgivlD4q845EEdDFmzWxj/Laay8n71jnZZoCrNubIzj/TyKTWS4IAF7q1LfzEL
         OXrIUKc0yRvjBpuD432sSiz+r4HasT991gPzAXPOHyLdpk//47YD74GS+aljNHWkZtPk
         l4jA==
X-Forwarded-Encrypted: i=1; AJvYcCU9UpfnTcTC53Zky12E7norliLwJ4jakOXNe5IuC+KeCuw6i4UJKxYrfqtCDLtLvQu1ouFKZOjgjbSP7RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEULOMQ1H3ERx1UHmOwxZX3BjQzkgjWWjD6g8yXeNZLMLhaE+P
	GUcRH9SEvbucq4vIWx6gec08yq4gjqQ91wjbxuwFv26sCiW1F+TbAaQjrOhkxwEfaoQ=
X-Gm-Gg: ASbGncu0BrulppR9KOryfJO6HqPTsDE5c+1c0+7zByctTk4gSKe22QJ6Uztsp4uYqPJ
	qE13sJUVZwY6yiwcIWa+gWwARkNBk/Db31pdqLPLM3wnWCY2VYQPR1xNXnQ/5qicNEMkB9XffGZ
	ovCaY2e89lztM1fQSLW7N+4sQ/m9CN9t70HfH+HzfMXpydhlmsABUKtLvvxc8+RPS7oMvMeZ1eu
	QgcJ2XG/Gxd0sYazK4meLBfqVtMZEygb+LhSK2P2vdUPQViroWZNG1znoZYboxCLGc0+mRqizAL
	5BfxHPrlGUOaIKkRqsskPm/N/4CmLoA8xtVyUNYyLH8Z0ws1dvReLKn2ACMt2HvxgguIwA==
X-Google-Smtp-Source: AGHT+IEIQNB9vXn483lHvLJjj700RgdbzHfAUE56Wc6QSRX5AYvxFzu5TfYpGMA0L0F7fB4pfrcJZw==
X-Received: by 2002:a05:6830:6f42:b0:739:fe04:7aec with SMTP id 46e09a7af769-73afc6821ffmr3875325a34.26.1751079875682;
        Fri, 27 Jun 2025 20:04:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb124960sm624104a34.66.2025.06.27.20.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:04:35 -0700 (PDT)
Date: Sat, 28 Jun 2025 06:04:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pranav Tyagi <pranav.tyagi03@gmail.com>,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ming.li@zohomail.com,
	rrichter@amd.com, peterz@infradead.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH v2] cxl/memdev: automate cleanup with __free()
Message-ID: <ef5ee5ac-5c8d-4717-aa84-7db085a556a9@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623083841.364002-1-pranav.tyagi03@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Tyagi/cxl-memdev-automate-cleanup-with-__free/20250623-164014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20250623083841.364002-1-pranav.tyagi03%40gmail.com
patch subject: [PATCH v2] cxl/memdev: automate cleanup with __free()
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280653.WmzTbwEN-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506280653.WmzTbwEN-lkp@intel.com/

smatch warnings:
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.

vim +/transfer +881 drivers/cxl/core/memdev.c

9521875bbe0055 Vishal Verma 2023-06-14  874  static enum fw_upload_err cxl_fw_write(struct fw_upload *fwl, const u8 *data,
9521875bbe0055 Vishal Verma 2023-06-14  875  				       u32 offset, u32 size, u32 *written)
9521875bbe0055 Vishal Verma 2023-06-14  876  {
aeaefabc59ec3c Dan Williams 2023-06-25  877  	struct cxl_memdev_state *mds = fwl->dd_handle;
aeaefabc59ec3c Dan Williams 2023-06-25  878  	struct cxl_dev_state *cxlds = &mds->cxlds;
8d8081cecfb994 Dave Jiang   2024-09-05  879  	struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
9521875bbe0055 Vishal Verma 2023-06-14  880  	struct cxl_memdev *cxlmd = cxlds->cxlmd;
f76a702ca63e85 Pranav Tyagi 2025-06-23 @881  	struct cxl_mbox_transfer_fw *transfer __free(kfree);

cleanup magic variables need to be initialized to NULL etc.

9521875bbe0055 Vishal Verma 2023-06-14  882  	struct cxl_mbox_cmd mbox_cmd;
9521875bbe0055 Vishal Verma 2023-06-14  883  	u32 cur_size, remaining;
9521875bbe0055 Vishal Verma 2023-06-14  884  	size_t size_in;
9521875bbe0055 Vishal Verma 2023-06-14  885  	int rc;
9521875bbe0055 Vishal Verma 2023-06-14  886  
9521875bbe0055 Vishal Verma 2023-06-14  887  	*written = 0;
9521875bbe0055 Vishal Verma 2023-06-14  888  
9521875bbe0055 Vishal Verma 2023-06-14  889  	/* Offset has to be aligned to 128B (CXL-3.0 8.2.9.3.2 Table 8-57) */
9521875bbe0055 Vishal Verma 2023-06-14  890  	if (!IS_ALIGNED(offset, CXL_FW_TRANSFER_ALIGNMENT)) {
9521875bbe0055 Vishal Verma 2023-06-14  891  		dev_err(&cxlmd->dev,
9521875bbe0055 Vishal Verma 2023-06-14  892  			"misaligned offset for FW transfer slice (%u)\n",
9521875bbe0055 Vishal Verma 2023-06-14  893  			offset);
9521875bbe0055 Vishal Verma 2023-06-14  894  		return FW_UPLOAD_ERR_RW_ERROR;

This return will try to free an uninitialized pointer.

9521875bbe0055 Vishal Verma 2023-06-14  895  	}
9521875bbe0055 Vishal Verma 2023-06-14  896  
9521875bbe0055 Vishal Verma 2023-06-14  897  	/*
aeaefabc59ec3c Dan Williams 2023-06-25  898  	 * Pick transfer size based on mds->payload_size @size must bw 128-byte
aeaefabc59ec3c Dan Williams 2023-06-25  899  	 * aligned, ->payload_size is a power of 2 starting at 256 bytes, and
aeaefabc59ec3c Dan Williams 2023-06-25  900  	 * sizeof(*transfer) is 128.  These constraints imply that @cur_size
aeaefabc59ec3c Dan Williams 2023-06-25  901  	 * will always be 128b aligned.
9521875bbe0055 Vishal Verma 2023-06-14  902  	 */
8d8081cecfb994 Dave Jiang   2024-09-05  903  	cur_size = min_t(size_t, size, cxl_mbox->payload_size - sizeof(*transfer));
9521875bbe0055 Vishal Verma 2023-06-14  904  
9521875bbe0055 Vishal Verma 2023-06-14  905  	remaining = size - cur_size;
9521875bbe0055 Vishal Verma 2023-06-14  906  	size_in = struct_size(transfer, data, cur_size);
9521875bbe0055 Vishal Verma 2023-06-14  907  
aeaefabc59ec3c Dan Williams 2023-06-25  908  	if (test_and_clear_bit(CXL_FW_CANCEL, mds->fw.state))
9521875bbe0055 Vishal Verma 2023-06-14  909  		return cxl_fw_do_cancel(fwl);
9521875bbe0055 Vishal Verma 2023-06-14  910  
9521875bbe0055 Vishal Verma 2023-06-14  911  	/*
9521875bbe0055 Vishal Verma 2023-06-14  912  	 * Slot numbers are 1-indexed
9521875bbe0055 Vishal Verma 2023-06-14  913  	 * cur_slot is the 0-indexed next_slot (i.e. 'cur_slot - 1 + 1')
9521875bbe0055 Vishal Verma 2023-06-14  914  	 * Check for rollover using modulo, and 1-index it by adding 1
9521875bbe0055 Vishal Verma 2023-06-14  915  	 */
aeaefabc59ec3c Dan Williams 2023-06-25  916  	mds->fw.next_slot = (mds->fw.cur_slot % mds->fw.num_slots) + 1;
9521875bbe0055 Vishal Verma 2023-06-14  917  
9521875bbe0055 Vishal Verma 2023-06-14  918  	/* Do the transfer via mailbox cmd */
9521875bbe0055 Vishal Verma 2023-06-14  919  	transfer = kzalloc(size_in, GFP_KERNEL);
9521875bbe0055 Vishal Verma 2023-06-14  920  	if (!transfer)
9521875bbe0055 Vishal Verma 2023-06-14  921  		return FW_UPLOAD_ERR_RW_ERROR;
9521875bbe0055 Vishal Verma 2023-06-14  922  
9521875bbe0055 Vishal Verma 2023-06-14  923  	transfer->offset = cpu_to_le32(offset / CXL_FW_TRANSFER_ALIGNMENT);
9521875bbe0055 Vishal Verma 2023-06-14  924  	memcpy(transfer->data, data + offset, cur_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

