Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC50221F30
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331488; cv=none; b=eVESCtT7QpAzuHylXgsdMDzwp7nulSOJWo2dJpo0ccvL+hc7IH0eSHaYC6mrHNQOVd3/PDcMRnDFggoMqLzaqToJD1MJWg+OLH7HAYwl7eKI0IVC5FWs+/pZ9/zHFyXQMbazW8AhUrMojvPBaS9IzwHaYAjyrtAahRFd5/UyvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331488; c=relaxed/simple;
	bh=0pEMp6R7QAB88B9N0EiVXYtD55h06b4RnP1RCeVt5bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKTJ0DQLNM8ZYq5iIbcUgvxUuPQUdUOcKIirCYL/WgXBtU4zO82/CuoYIGxJ2c6/gaHJa5nxM9KPy714ECiDcSZhzNtm2/kzqz+PvdPvX3MiizkFvkmTaNpJCYAHclOpOra5xMyI3bNYLCQZy3S8lF7gdFA3wZEwklf8vWQ65DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auJlP5xK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auJlP5xK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750331487; x=1781867487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0pEMp6R7QAB88B9N0EiVXYtD55h06b4RnP1RCeVt5bE=;
  b=auJlP5xKagcvyfqSfChuNgjH1gJXFh9Qus9E8fwyXO5Uj0ehfIFTkANA
   3EUg9Q2WsOAlxEaqRzuUClOZfDKshl66QRWL3Qyf1G67i5ElrIkRByM8M
   tks0deaPrDn9BQWFZxpTnJVcDHUmLJvjKy+mpJw/w87WrfCYn6iWBC6ho
   u7PpwOTSouNSJ02uOBHJoPGho3OH0DZUATiXnJvXSv5ESpbY5xb5ZnCM+
   In8zhIOqKYzfoXesO9TlygOCbIioqPcpkjTao3y0NXAJogsXzoHNGGs87
   T3fR3damLmd9o+9XKKuTGuCL6sZ5g3FexVr250hqMcynUcu32IiPT/p8p
   A==;
X-CSE-ConnectionGUID: mktmerndQJSxcKiPKZhC1Q==
X-CSE-MsgGUID: xOOMiT0IT7G7UAYgd0IaAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52460988"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52460988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:11:26 -0700
X-CSE-ConnectionGUID: ZwCQJz08SVeI9iyzLVU0yg==
X-CSE-MsgGUID: mma9Fw8dSqSjYO5XEs32dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="181649743"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:11:26 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2696E20B5736;
	Thu, 19 Jun 2025 04:11:24 -0700 (PDT)
Message-ID: <d97fc799-ab9b-4c6a-a77e-8b542ac82efa@linux.intel.com>
Date: Thu, 19 Jun 2025 07:11:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
 <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
 <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
 <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
 <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
 <1bc9de32-2599-483f-8c6a-6da59f8d9549@linux.intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <1bc9de32-2599-483f-8c6a-6da59f8d9549@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 8:41 p.m., Mi, Dapeng wrote:
> 
> On 6/18/2025 9:15 PM, Liang, Kan wrote:
>>
>> On 2025-06-18 8:28 a.m., Mi, Dapeng wrote:
>>>>>>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>>>>>>> intr/user vector width (although I'm not quite sure what the use would
>>>>>>> be).
>>>>> The reason that I prefer to add 2 separate "words" item is that user could
>>>>> sample interrupt and user space SIMD regs (but with different bit-width)
>>>>> simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0".
>>>> I'm not sure why the user wants a different bit-width. The
>>>> --user-regs=XMM0" doesn't seem to provide more useful information.
>>>>
>>>> Anyway, I believe the tool can handle this case. The tool can always ask
>>>> YMM0 for both --intr-regs and --user-regs, but only output the XMM0 for
>>>> --user-regs. The only drawback is that the kernel may dump extra
>>>> information for the --user-regs. I don't think it's a big problem.
>>> If we intent to handle it in user space tools, I'm not sure if user space
>>> tool can easily know which records are from user space and filter out the
>>> SIMD regs from kernel space and how complicated would the change be. IMO,
>>> adding an extra u16 "words" would be much easier and won't consume too much
>>> memory.
>> The filter is always done in kernel for --user-regs. The only difference
>> is that the YMM (after filter) will be dumped to the perf.data. The tool
>> just show the XMM registers to the end user.
> 
> Ok. But there could be another case, user may want to sample some APX eGPRs
> in user space and sample SIMD regs in interrupt, like "--intr-regs=YMM0,
> --user-regs=R16", then we have to define 2 separate "words" fields.
> 

Not for eGPRs. It uses the regular GP regs space, which implies u64 for
a 64b kernel. The "words" fields is only for vector and predicate registers.

I've stated working on the V2. The new interface would be as below.

diff --git a/include/uapi/linux/perf_event.h
b/include/uapi/linux/perf_event.h
index 78a362b80027..f7b8971fa99d 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			184	/* Add: sample_simd_regs */

 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,24 @@ struct perf_event_attr {
 	__u64	sig_data;

 	__u64	config3; /* extension of config2 */
+
+
+	/*
+	 * Defines set of SIMD registers to dump on samples.
+	 * The sample_simd_req_enabled !=0 implies the
+	 * set of SIMD registers is used to config all SIMD registers.
+	 * If !sample_simd_req_enabled, sample_regs_XXX may be used to
+	 * config some SIMD registers on X86.
+	 */
+	union {
+		__u16 sample_simd_reg_enabled;
+		__u16 sample_simd_pred_reg_qwords;
+	};
+	__u16 sample_simd_pred_reg_intr;
+	__u16 sample_simd_pred_reg_user;
+	__u16 sample_simd_reg_qwords;
+	__u64 sample_simd_reg_intr;
+	__u64 sample_simd_reg_user;
 };

 /*
@@ -1016,7 +1035,15 @@ enum perf_event_type {
 	 *      } && PERF_SAMPLE_BRANCH_STACK
 	 *
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *	  	u16 nr_vectors;
+	 *	  	u16 vector_qwords;
+	 *	  	u16 nr_pred;
+	 *	  	u16 pred_qwords;
+	 *	  	u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && sample_simd_reg_enabled
+	 *	} && PERF_SAMPLE_REGS_USER
 	 *
 	 *	{ u64			size;
 	 *	  char			data[size];
@@ -1043,7 +1070,15 @@ enum perf_event_type {
 	 *	{ u64			data_src; } && PERF_SAMPLE_DATA_SRC
 	 *	{ u64			transaction; } && PERF_SAMPLE_TRANSACTION
 	 *	{ u64			abi; # enum perf_sample_regs_abi
-	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
+	 *	  u64			regs[weight(mask)];
+	 *	  struct {
+	 *	  	u16 nr_vectors;
+	 *	  	u16 vector_qwords;
+	 *	  	u16 nr_pred;
+	 *	  	u16 pred_qwords;
+	 *	  	u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
+	 *	  } && sample_simd_reg_enabled
+	 *	} && PERF_SAMPLE_REGS_INTR
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
 	 *	{ u64			cgroup;} && PERF_SAMPLE_CGROUP
 	 *	{ u64			data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE


Thanks,
Kan
