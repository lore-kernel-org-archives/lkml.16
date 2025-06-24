Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7628ECE2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772480; cv=none; b=bMi6uXtwO7liaro/RDLXN9EvCnVu+i1vtT2Qy2cSPp6+msi/eDzIVF2h2tlZQOI7cJklTr3H7opw0+xlUfQ63wlocm4Dm3sreGodksGbdA595wrgmnugnGwYIDsMzfN8P1XPzkhIu0bE+IYQ0JVobqgFr6HUZySiXjiv3JOubvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772480; c=relaxed/simple;
	bh=jmFpIMRpxsSLGoUiR8GyCNXZX+mlzOk8oXjCkCEDPXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LGFrNo0itB3kQBpG9kAO2SoFbvtkCNVWlMyHAz3NmBesRdr3OYu9/xRoDmX4TwZoWdNpfcES409p516jCenY052c/hX6cn6IUSAwhp3apDm0PMuZuy8ERriWt5+ra2S3OVPQJerzhbhuPI3hpTfQMahteoxQ9Xo2PgGxqoisg5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdDgVlvL; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdDgVlvL"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73a5c3e1b7aso3775911a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772477; x=1751377277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
        b=KdDgVlvLmS4ljhPHj4Z5vsLFBJ85InDRuc2ryzQLSovcO1sRe1VQ6fs3afpbNRKWKF
         O8Pw0vvXeMhTSEGMMjbNXIl4pa3D4Qmywxz59Z4XBXwDpVj15cTM+vVr1Uy2mf6p59b3
         FdiAj0m9qKZbwV3Yz0oUWC/KwueqGhuDk+JUQwnaLAz8mOJMMQxKvMuqQ1AQvOF+IU2K
         +/EAwrkdVrnHlwFOksRHHbZ+4dPYYbzP0GULJg4CwkWJk5iOOA1t9Qjz7xl8YN//nHHI
         OZS7J/zR4FG4uG/7oP5h4vOadvZA2OZP//9CGPhQ2a+31MiMzx6g1f7P1vlH9iEq0CNX
         e2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772477; x=1751377277;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
        b=Di9kxoVn6Gu25zvSCtwim8mkMOQSZlLANGLSlGTiQ8Lql/Sl4ybjBzKaap4V7+szOe
         +Ul9mERcxdwcLLNJkHqusJRxXSNjtibrGNx/aCI81JGzJtXQJSQzVT2NFoXgYL/d+WXu
         dQO723c/sBzoNl9S0f4Tr0BQaIp5+siw308Wgk9c/OiYmXF7sGf1oolbrXpWeWUIInEQ
         1vds+B3p53746f+JxGWBc6rrd1YbYEydvpegwwvfSe7zYFDZbyP7AmXyrtJHFaK1juTh
         39gto5GQ40nFu0NARElx8z4FrYoqDIZ/Y8tJh92aQjCGB75IlemyB1jE8NCsd2keGNrd
         I5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1J4OzvK3hqBPt/VOyzs3mbTXR8j2WOPyQEwXUBhPKFQlULTuL91uANoL+l/SfjnWs5+rhIDxf2vnMbbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGeRdIUX353KpDVIVcMGEvJZG9pUpJaN3zZJvtw9YVbTjEfCG
	tF5bfj/0hdCcSCsuuSxWzLpNizvuqPAi6HUE7UwtM7TGXLPCaigIUlhVQ2T1k5CWrxR5QMpafh6
	pYqEf
X-Gm-Gg: ASbGncvERMNuQH7UM0j0TkIt9wG1p3bvg9zuKUKhW6kQjElvNLSFS9Rwpy1XnrHmgxS
	+WGwG41fCiSVJSh3TQnyXDG0jbUNBmhKR2X1lAWMiLl79kktqlBUhbAArRBv8j3nHP7Fu3GlTzW
	iQlo3sIGBmC1uYZjlnQM9m7PSrKpVH66ex5QWoUv+VkJD47S5wmg9pbp91XtrpjU302eRICoxfZ
	XfiGqM6Bf5N0LQev/U/u2g8Adr4fTZks7e3yvk4Z1KNoUKTCuaAMR2s2eKuX/AF39DpwNmpkwSk
	EbXg+WOuIB5tboq+qT27gH1Rk+1oyAz9OkW7AqfXYhP9gDDw/COguO1tlyYzSLv6fajiQpHY4tt
	gBFyx
X-Google-Smtp-Source: AGHT+IEiuhdW8/sSiJzR1DxhRU/+og+q0UhK5YrSTANwnnO94EH7OfmpA0IaX4cQg+vq2e5zOFcNyQ==
X-Received: by 2002:a05:6870:179c:b0:2e9:8ed9:16fc with SMTP id 586e51a60fabf-2eedba8115cmr10962084fac.11.1750772477122;
        Tue, 24 Jun 2025 06:41:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead8e17c1sm2067862fac.44.2025.06.24.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:41:15 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Badal Nilawar <badal.nilawar@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org, daniele.ceraolospurio@intel.com,
	jgg@nvidia.com
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
Message-ID: <aa407944-588c-4514-9523-6f13a989f4ae@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-10-badal.nilawar@intel.com>

Hi Badal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-10-badal.nilawar%40intel.com
patch subject: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print version info
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241449.WdiucfJp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241449.WdiucfJp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:90 parse_cpd_header() error: uninitialized symbol 'offset'.
drivers/gpu/drm/xe/xe_late_bind_fw.c:155 parse_lb_layout() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:195 xe_late_bind_wait_for_worker_completion() warn: inconsistent indenting

vim +/offset +90 drivers/gpu/drm/xe/xe_late_bind_fw.c

f9ea24fb9528adc Badal Nilawar 2025-06-19   49  static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19   50  			    const void *data, size_t size, const char *manifest_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19   51  {
f9ea24fb9528adc Badal Nilawar 2025-06-19   52  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19   53  	const struct gsc_cpd_header_v2 *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19   54  	const struct gsc_manifest_header *manifest;
f9ea24fb9528adc Badal Nilawar 2025-06-19   55  	const struct gsc_cpd_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19   56  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   57  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19   58  	u32 offset;
                                                ^^^^^^^^^^^

f9ea24fb9528adc Badal Nilawar 2025-06-19   59  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19   60  
f9ea24fb9528adc Badal Nilawar 2025-06-19   61  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19   62  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   63  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19   64  
f9ea24fb9528adc Badal Nilawar 2025-06-19   65  	/* manifest_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19   66  	xe_assert(xe, manifest_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19   67  
f9ea24fb9528adc Badal Nilawar 2025-06-19   68  	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19   69  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19   70  
f9ea24fb9528adc Badal Nilawar 2025-06-19   71  	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   72  		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   73  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19   74  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   75  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   76  
f9ea24fb9528adc Badal Nilawar 2025-06-19   77  	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19   78  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   79  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   80  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19   81  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   82  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   83  
f9ea24fb9528adc Badal Nilawar 2025-06-19   84  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19   85  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19   86  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19   87  		if (strcmp(entry->name, manifest_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19   88  			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
                                                                ^^^^^^^^
Only initialized if found.

f9ea24fb9528adc Badal Nilawar 2025-06-19   89  
f9ea24fb9528adc Badal Nilawar 2025-06-19  @90  	if (!offset) {
                                                     ^^^^^^
Uninitialized.

It's a good idea for developers to set CONFIG_INIT_STACK_ALL_PATTERN=y
in their testing.

f9ea24fb9528adc Badal Nilawar 2025-06-19   91  		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   92  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19   93  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   94  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   95  
f9ea24fb9528adc Badal Nilawar 2025-06-19   96  	min_size = offset + sizeof(struct gsc_manifest_header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   97  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   98  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   99  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  100  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  101  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  102  
f9ea24fb9528adc Badal Nilawar 2025-06-19  103  	manifest = data + offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  104  
f9ea24fb9528adc Badal Nilawar 2025-06-19  105  	lb_fw->version.major = manifest->fw_version.major;
f9ea24fb9528adc Badal Nilawar 2025-06-19  106  	lb_fw->version.minor = manifest->fw_version.minor;
f9ea24fb9528adc Badal Nilawar 2025-06-19  107  	lb_fw->version.hotfix = manifest->fw_version.hotfix;
f9ea24fb9528adc Badal Nilawar 2025-06-19  108  	lb_fw->version.build = manifest->fw_version.build;
f9ea24fb9528adc Badal Nilawar 2025-06-19  109  
f9ea24fb9528adc Badal Nilawar 2025-06-19  110  	return 0;
f9ea24fb9528adc Badal Nilawar 2025-06-19  111  }
f9ea24fb9528adc Badal Nilawar 2025-06-19  112  
f9ea24fb9528adc Badal Nilawar 2025-06-19  113  /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
f9ea24fb9528adc Badal Nilawar 2025-06-19  114  static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19  115  			   const void *data, size_t size, const char *fpt_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19  116  {
f9ea24fb9528adc Badal Nilawar 2025-06-19  117  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19  118  	const struct csc_fpt_header *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19  119  	const struct csc_fpt_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19  120  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19  121  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19  122  	u32 offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  123  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19  124  
f9ea24fb9528adc Badal Nilawar 2025-06-19  125  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19  126  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  127  
f9ea24fb9528adc Badal Nilawar 2025-06-19  128  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19  129  
f9ea24fb9528adc Badal Nilawar 2025-06-19  130  	/* fpt_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19  131  	xe_assert(xe, fpt_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19  132  
f9ea24fb9528adc Badal Nilawar 2025-06-19  133  	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19  134  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19  135  
f9ea24fb9528adc Badal Nilawar 2025-06-19  136  	if (header->header_length < sizeof(struct csc_fpt_header)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  137  		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  138  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19  139  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  140  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  141  
f9ea24fb9528adc Badal Nilawar 2025-06-19  142  	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19  143  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  144  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  145  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  146  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  147  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  148  
f9ea24fb9528adc Badal Nilawar 2025-06-19  149  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19  150  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19  151  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19  152  		if (strcmp(entry->name, fpt_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19  153  			offset = entry->offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  154  
f9ea24fb9528adc Badal Nilawar 2025-06-19 @155  	if (!offset) {

Same.

f9ea24fb9528adc Badal Nilawar 2025-06-19  156  		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  157  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19  158  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  159  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  160  
f9ea24fb9528adc Badal Nilawar 2025-06-19  161  	min_size = offset + sizeof(struct gsc_cpd_header_v2);
f9ea24fb9528adc Badal Nilawar 2025-06-19  162  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  163  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  164  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  165  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  166  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  167  
f9ea24fb9528adc Badal Nilawar 2025-06-19  168  	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
f9ea24fb9528adc Badal Nilawar 2025-06-19  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

