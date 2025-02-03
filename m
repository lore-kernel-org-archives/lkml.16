Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440420459A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589237; cv=none; b=ROjnQSgi1AGI6NttiAIYgT7u9aEQcYHSdrHEkX7QlHDVNiTtk5Fs6Y4xiXOzMWVXBe4UNi8F6+akyIIXOIrDQ9LeyzzbZ0cGFJNUqVvaeYlYfWnEwwek8BpRghzksMzKOijmhbazuJHK565p2j/SsDffSO1InPqe2lREzwK0zD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589237; c=relaxed/simple;
	bh=iT4nOmTo0qs93A/ByVuAvKNO0ZVQLL9OYxCEOF4exlw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jSwgX2TroPsUhftiHSXzLHWSgGMdA2tkFflJ1NbPYaBF0WhB7k3UOjVrG21uXnnGqH58O+R2Tn5ncxUaVjmqnKGzIdWQKAH3ERzXuQyb9g/u7szcnY/ElaA2vQyL+sFA27oKwnElD5FtotMbEMCrOsqEVctnH3BeXlLfSZ3M7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--peternewman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXKlb1oS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--peternewman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXKlb1oS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso31762145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738589233; x=1739194033; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+vRf77xml4mHTu6O1aUiY50kmdC/JGj1qSPGz7v6MU=;
        b=qXKlb1oSM/n2FOeIpqxTUzGXCnzSPTjNSI6mKwfD+/gbrNk3LnmtD1LS1sv7Mmky7L
         JiPYX539FG2QGvq8B5Fy+2SSAeTD8C+jWA8iYehcZrmcxEODFkwZVHupkNy2sEJpGIN+
         7waYSujI26kSYfM3hkxF7tI4a9szEztX0hjDCc1HlH+8y1K4YVB3UZ/mkjbWL91MagRM
         BtXeLx+043zbK/1gA1DZidPiqDO51K7EziQd0YFR58yJzUY1U8ISRZ36q6KlkzINz1MD
         JHsW3EMU3ujfrVB85E0J5IJWLOjfCDBvn70rzKy4ukiV6H9EGBcmGRi8kA2fH8GQ46SR
         +KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589233; x=1739194033;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+vRf77xml4mHTu6O1aUiY50kmdC/JGj1qSPGz7v6MU=;
        b=E1EiL/o8ixVtIy/FKU6FmV2bsA6HKz8vLRqo5SvaV8OB9AVugVG2yRgwY81ELBfo/S
         DkPVx9GgajfHR92UgwWUU9EJ4gW6ONZhKQSfG+AF1+qA8RA4KOGtefqQ26YOXXEcffd5
         +bmVeHmsnFXp8DW1mq5LVh52CcvHFSs2Hbi1Arjk9AaidJ07lLbHulH8BaNuEVibvlx4
         o1lbt9QLNXBnCPGicX5xUk95AkO9n0ctPL6CN3xIvMNvWNKwzrZtuhUCcbN/POcmWTAh
         NnUZBh4rR/UU5cWUxfpMkNF0LMEBwae4BpvpZZJkltvQa0KJ2NK+mGsLFCq7QPnQ4mGY
         fSxg==
X-Forwarded-Encrypted: i=1; AJvYcCVjPPANeBr0f65RYo6YvYXutb7Vv06i1E7f1B4E7T/NfpkBGU0YllXHdplDoGaYWhRrapUGoOAWpRm+RYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMOIldZsQdbxpiO26GkMHjDvugDyYrRCNh4LY6jYFg1vrDy5Q
	1yH5zCxf/EfyFp58hdkopBkHDSb21ARYJEp2KjGLrNBhkuUu0vqNcRtCAvDdmR7BW9S72MM4Ihp
	3rIdJ4P/7SUnr/TP//+mrCg==
X-Google-Smtp-Source: AGHT+IHwjwHvkkW+jcg/+Aa1C5HQN+uqueTyLSRP/rLwlvjOSfvDXy7ajCdgb0kho3srjN4gD1XAZXP+gvZYaeXjjQ==
X-Received: from wmqb19.prod.google.com ([2002:a05:600c:4e13:b0:436:1a60:654e])
 (user=peternewman job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c356:0:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-438dd1a5b55mr168374875e9.19.1738589233723;
 Mon, 03 Feb 2025 05:27:13 -0800 (PST)
Date: Mon,  3 Feb 2025 14:26:42 +0100
In-Reply-To: <35fc70fd-0281-4ac8-b32b-efa2f4516901@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <35fc70fd-0281-4ac8-b32b-efa2f4516901@amd.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203132642.2746754-1-peternewman@google.com>
Subject: Re: [PATCH v9 09/26] x86/resctrl: Introduce interface to display
 number of monitoring counters
From: Peter Newman <peternewman@google.com>
To: babu.moger@amd.com
Cc: akpm@linux-foundation.org, andrew.cooper3@citrix.com, bp@alien8.de, 
	brijesh.singh@amd.com, corbet@lwn.net, daniel.sneddon@linux.intel.com, 
	dave.hansen@linux.intel.com, ebiggers@google.com, eranian@google.com, 
	fenghua.yu@intel.com, hpa@zytor.com, james.morse@arm.com, 
	jithu.joseph@intel.com, jpoimboe@kernel.org, kai.huang@intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, mario.limonciello@amd.com, mingo@redhat.com, 
	paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com, 
	peternewman@google.com, reinette.chatre@intel.com, rostedt@goodmis.org, 
	sandipan.das@amd.com, seanjc@google.com, tan.shaopeng@fujitsu.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, thuth@redhat.com, 
	tony.luck@intel.com, x86@kernel.org, xiaoyao.li@intel.com, xin3.li@intel.com, 
	xiongwei.song@windriver.com
Content-Type: text/plain; charset="UTF-8"

Hi Babu,

On Mon, Nov 18, 2024 at 03:31:28PM -0600, Moger, Babu wrote:
> Hi Reinette,
> 
> On 11/15/24 18:06, Reinette Chatre wrote:
> > Hi Babu,
> > 
> > On 10/29/24 4:21 PM, Babu Moger wrote:
> >> The mbm_cntr_assign mode provides an option to the user to assign a
> >> counter to an RMID, event pair and monitor the bandwidth as long as
> >> the counter is assigned. Number of assignments depend on number of
> >> monitoring counters available.
> >>
> >> Provide the interface to display the number of monitoring counters
> >> supported. The interface file 'num_mbm_cntrs' is available when an
> >> architecture supports mbm_cntr_assign mode.
> >>
> > 
> > As mentioned in previous patch, do you think it may be possible to
> > have a value for num_mbm_cntrs for non-ABMC AMD systems? If that is
> > available and always exposed to user space (irrespective of
> > mbm_cntr_assign mode) then it would be clear to user space on
> > benefits/risks of running a "default" mode.
> 
> I am trying the work-around to get the number of max active RMIDs in
> default mode. The method is to loop through all of the recently assigned
> RMID's to see if any of their QM_CTR.U bits transition from 0->1.
> 
> I am not successful in getting it to work so far. I remember Peter was
> trying this before in soft-ABMC. Peter, Any success with that?

Sorry I missed this question before. By now maybe you've already debugged your
own implementation...

Here's what I've been using:

-- >8 --
Subject: [PATCH] x86/resctrl: Detect MBM counters on pre-ABMC AMD
 implementations

This procedure is based on information provided directly by AMD
which cannot currently be corroborated by any public documentation.

In particular, it assumes that deallocation of MBM counters for RMIDs
is driven directly by writing a new RMID value into PQR_ASSOC.

Signed-off-by: Peter Newman <peternewman@google.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 83 ++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 377b5db667930..4a13eab110510 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -705,6 +705,7 @@ int closids_supported(void);
 void closid_free(int closid);
 int alloc_rmid(u32 closid);
 void free_rmid(u32 closid, u32 rmid);
+int amd_detect_mbm_counters(void);
 int __init rdt_get_mon_l3_config(struct rdt_resource *r);
 void __exit rdt_put_mon_l3_config(void);
 bool __init rdt_cpu_has(int flag);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 2dd6c47c9276a..f4a59251134d3 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1172,6 +1172,89 @@ static __init int snc_get_config(void)
 	return ret;
 }
 
+static void zero_rmid(void *unused)
+{
+	wrmsr(MSR_IA32_PQR_ASSOC, 0, 0);
+}
+
+int amd_detect_mbm_counters(void)
+{
+	struct cpu_cacheinfo *ci;
+	u32 rmid, test_rmid;
+	int llc_index;
+	u64 ctr;
+
+	/*
+	 * The following detection mechanism below provided by AMD. It applies
+	 * only to pre-ABMC models (Rome, Milan, Genoa).
+	 */
+	if (WARN_ON(boot_cpu_data.x86_vendor != X86_VENDOR_AMD))
+		return -1;
+	if (WARN_ON(rdt_cpu_has(X86_FEATURE_ABMC)))
+		return -1;
+
+	/*
+	 * Must not migrate to another CCX during this test. Assume no IRQ
+	 * handler would access the MSRs used below before resctrl is
+	 * initialized.
+	 */
+	ci = get_cpu_cacheinfo(get_cpu());
+	llc_index = ci->num_leaves - 1;
+
+	/* Ensure PQR_ASSOC.RMID = 0 in this CCX. */
+	if (ci->cpu_map_populated)
+		on_each_cpu_mask(&ci->info_list[llc_index].shared_cpu_map,
+				 zero_rmid, NULL, true);
+
+	rmid = 0;
+	while (true) {
+		wrmsr(MSR_IA32_PQR_ASSOC, rmid, 0);
+		wrmsr(MSR_IA32_QM_EVTSEL, QOS_L3_MBM_TOTAL_EVENT_ID, rmid);
+
+		/*
+		 * Ensure that a counter has been allocated on this RMID. The
+		 * loop below is expected to complete in two iterations.
+		 */
+		do {
+			rdmsrl(MSR_IA32_QM_CTR, ctr);
+
+			if (WARN_ON(ctr & RMID_VAL_ERROR)) {
+				pr_err("failed to read total event on rmid %u\n",
+				       rmid);
+				put_cpu();
+				return 0;
+			}
+		} while (ctr & RMID_VAL_UNAVAIL);
+
+		/*
+		 * The order in which counters are reused is not predictable, so
+		 * check all previously-assigned counters. If any loses its
+		 * value, then too many are in use as a result of the last
+		 * PQR_ASSOC write.
+		 */
+		for (test_rmid = 0; test_rmid < rmid; test_rmid++) {
+			wrmsr(MSR_IA32_QM_EVTSEL, QOS_L3_MBM_TOTAL_EVENT_ID,
+			      test_rmid);
+			rdmsrl(MSR_IA32_QM_CTR, ctr);
+
+			/*
+			 * As soon as a previous counter loses a value, we have
+			 * determined the number of RMIDs which can hold a value
+			 * simultaneously in this CCX.
+			 */
+			if (ctr & RMID_VAL_UNAVAIL) {
+				put_cpu();
+				return rmid;
+			}
+		}
+		rmid++;
+	}
+
+	put_cpu();
+
+	return 0;
+}
+
 int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 {
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
