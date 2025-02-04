Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382220B1EC;
	Tue,  4 Feb 2025 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670266; cv=none; b=n4l9BLVT/0ccGvURpGMjMKzOPTtbKNkyWhd+Pn88zcAihvijHZxWENRgy/d3knZoFY4ktLOPbDSzezrDhCB0Rpk2TnLs7up0Ue8UzF4Og0GST4Fslqu4lrPq84dkgL5KjY7HQbLgGBNVTLoASXwOgIQDqirqkBPypr3ramApZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670266; c=relaxed/simple;
	bh=xetoz271NfKBpzPsOK8CpBVPDV8JZHEMs8vOPjMiL3w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ej/pBbhDEfXF9JCicSuiLOT4s4Pi9CFp4iB35DXdU8B19b8twIbBqRuEU3PaKTn5xuIOl+Wxb/+ws2j9gzOgGcJ8ol+cfo0sTwb7ZVHOswioc77LLz43dc3WCmx9wfdeTPBpdYC44YfPAKxLXRctgPxRVgXAt8r8aFdh1/Qd0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=VSSXKNi1; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="VSSXKNi1"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BKKb5026072;
	Tue, 4 Feb 2025 03:57:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=OLOf6j0vEXaxKRIhcIOnM+CnA
	3ZGFZPPAbxhGq/ntMg=; b=VSSXKNi1qmzpa+A+wzwRb73QEJc6/8iaDXGoLCTWU
	/DpniJdVg9XCouTMH25DxMlN1VlpRZpO4f9Bnup2ZKjLW9k99YNcHy2gE6loTjua
	Fl6yuoT3nZtLjBTFbaoLTSTXYky3TmnoNhIHSXKkBn4HP3oWW/Y19s2Ne80a+slW
	OOJGGB/k9zOQLw+rlCYDg0dEhkiLXorhKFpIdfQ+JcA2T4Fx8jPFFiFsHyBjnnw5
	OGt8Sh8Zc6ZaOMXxWF9u7W2hnVOzN50P0a6HPBdAPRP6m7ufnzEkDpM04n8D1dgq
	sbo8vQLjfg0Pd/8StEiTLPcjSswlYxhBWEAaFszecxGfg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44khwx01p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:57:19 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Feb 2025 03:57:17 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 4 Feb 2025 03:57:17 -0800
Received: from hyd1403.caveonetworks.com (unknown [10.29.37.84])
	by maili.marvell.com (Postfix) with SMTP id 52E2C5B6921;
	Tue,  4 Feb 2025 03:57:12 -0800 (PST)
Date: Tue, 4 Feb 2025 17:27:11 +0530
From: Linu Cherian <lcherian@marvell.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: <mike.leach@linaro.org>, <james.clark@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Anil Kumar Reddy <areddy3@marvell.com>,
        "Tanmay
 Jagdale" <tanmay@marvell.com>
Subject: Re: [PATCH v13 5/8] coresight: tmc: Add support for reading crash
 data
Message-ID: <20250204115711.GA1525185@hyd1403.caveonetworks.com>
References: <20241216053014.3427909-1-lcherian@marvell.com>
 <20241216053014.3427909-6-lcherian@marvell.com>
 <9e3fb9f6-2f95-4f84-8fa3-1789cb753e2e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e3fb9f6-2f95-4f84-8fa3-1789cb753e2e@arm.com>
X-Proofpoint-GUID: p_-QSLMDaUY547ybX7BM_0l1nXCbUH_d
X-Proofpoint-ORIG-GUID: p_-QSLMDaUY547ybX7BM_0l1nXCbUH_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01

Hi Suzuki,


On 2025-01-21 at 20:26:03, Suzuki K Poulose (suzuki.poulose@arm.com) wrote:
> Hi Linu
> 
> On 16/12/2024 05:30, Linu Cherian wrote:
> > * Add support for reading crashdata using special device files.
> >    The special device files /dev/crash_tmc_xxx would be available
> >    for read file operation only when the crash data is valid.
> > 
> > * User can read the crash data as below
> > 
> >    For example, for reading crash data from tmc_etf sink
> > 
> >    #dd if=/dev/crash_tmc_etfXX of=~/cstrace.bin
> > 
> > Signed-off-by: Anil Kumar Reddy <areddy3@marvell.com>
> > Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> > Signed-off-by: Linu Cherian <lcherian@marvell.com>
> > ---
> > Changelog from v12:
> > * Fixed wrong buffer pointer passed to coresight_insert_barrier_packet
> > * tmc_read_prepare_crashdata need to be called only once and
> >    hence removed from read path and added to tmc_probe.
> >    As as side effect, tmc_read_unprepare_crashdata is removed as well.
> > * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
> >    avoided taking locks as its called from probe function alone.
> > * Introduced read status flag, "reading" specific to reserved buffer to keep the
> >    reserved buffer reading independent of the regular buffer and updated
> >    during tmc_crashdata_open/release functions
> > * is_tmc_crashdata_valid is made static as its used only within
> >    coresight-tmc-core.c
> > * tmc_get_resvbuf_trace definition moved up before the first invocation
> >    from tmc_prepare_crashdata
> > * Replaced constant with TMC_STS_FULL
> > 
> >   .../hwtracing/coresight/coresight-tmc-core.c  | 213 +++++++++++++++++-
> >   .../hwtracing/coresight/coresight-tmc-etr.c   |  22 +-
> >   drivers/hwtracing/coresight/coresight-tmc.h   |  14 +-
> >   3 files changed, 246 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > index 1e3938ec12cb..6ef68b56de22 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > @@ -105,6 +105,124 @@ u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata)
> >   	return mask;
> >   }
> > +static bool is_tmc_crashdata_valid(struct tmc_drvdata *drvdata)
> > +{
> > +	struct tmc_crash_metadata *mdata;
> > +
> > +	if (!tmc_has_reserved_buffer(drvdata) ||
> > +	    !tmc_has_crash_mdata_buffer(drvdata))
> > +		return false;
> > +
> > +	mdata = drvdata->crash_mdata.vaddr;
> > +
> > +	/* Check version match */
> > +	if (mdata->version != CS_CRASHDATA_VERSION)
> > +		return false;
> > +
> > +	/* Check for valid metadata */
> > +	if (!mdata->valid) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"Data invalid in tmc crash metadata\n");
> > +		return false;
> > +	}
> > +
> > +	/*
> > +	 * Buffer address given by metadata for retrieval of trace data
> > +	 * from previous boot is expected to be same as the reserved
> > +	 * trace buffer memory region provided through DTS
> > +	 */
> > +	if (drvdata->resrv_buf.paddr != mdata->trace_paddr) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"Trace buffer address of previous boot invalid\n");
> > +		return false;
> > +	}
> > +
> 
> 
> > +	/* Check data integrity of metadata */
> > +	if (mdata->crc32_mdata != find_crash_metadata_crc(mdata)) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"CRC mismatch in tmc crash metadata\n");
> > +		return false;
> > +	}
> > +	/* Check data integrity of tracedata */
> > +	if (mdata->crc32_tdata != find_crash_tracedata_crc(drvdata, mdata)) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"CRC mismatch in tmc crash tracedata\n");
> > +		return false;
> > +	}
> 
> The last two dev_dbg() could be made dev_info/dev_err() as it is a serious
> problem, that must be reported to the user.

Ack.

> 
> > +
> > +	return true;
> > +}
> > +
> > +static inline ssize_t tmc_get_resvbuf_trace(struct tmc_drvdata *drvdata,
> > +					  loff_t pos, size_t len, char **bufpp)
> > +{
> > +	s64 offset;
> > +	ssize_t actual = len;
> > +	struct tmc_resrv_buf *rbuf = &drvdata->resrv_buf;
> > +
> > +	if (pos + actual > rbuf->len)
> > +		actual = rbuf->len - pos;
> > +	if (actual <= 0)
> > +		return 0;
> > +
> > +	/* Compute the offset from which we read the data */
> > +	offset = rbuf->offset + pos;
> > +	if (offset >= rbuf->size)
> > +		offset -= rbuf->size;
> > +
> > +	/* Adjust the length to limit this transaction to end of buffer */
> > +	actual = (actual < (rbuf->size - offset)) ?
> > +		actual : rbuf->size - offset;
> > +
> > +	*bufpp = (char *)rbuf->vaddr + offset;
> > +
> > +	return actual;
> > +}
> > +
> > +static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
> > +{
> > +	char *bufp;
> > +	int ret = 0;
> 
> minor nit: This variable can be omitted.
> 
> > +	ssize_t len;
> > +	u32 status, size;
> > +	u64 rrp, rwp, dba;
> > +	struct tmc_resrv_buf *rbuf;
> > +	struct tmc_crash_metadata *mdata;
> > +
> > +	mdata = drvdata->crash_mdata.vaddr;
> > +	rbuf = &drvdata->resrv_buf;
> > +
> > +	rrp = mdata->tmc_rrp;
> > +	rwp = mdata->tmc_rwp;
> > +	dba = mdata->tmc_dba;
> > +	status = mdata->tmc_sts;
> > +	size = mdata->tmc_ram_size << 2;
> > +
> > +	/* Sync the buffer pointers */
> > +	rbuf->offset = rrp - dba;
> > +	if (status & TMC_STS_FULL)
> > +		rbuf->len = size;
> > +	else
> > +		rbuf->len = rwp - rrp;
> > +
> > +	/* Additional sanity checks for validating metadata */
> > +	if ((rbuf->offset > size) ||
> > +	    (rbuf->len > size)) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"Offset and length invalid in tmc crash metadata\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (status & TMC_STS_FULL) {
> > +		len = tmc_get_resvbuf_trace(drvdata, 0x0,
> > +					    CORESIGHT_BARRIER_PKT_SIZE, &bufp);
> > +		if (len >= CORESIGHT_BARRIER_PKT_SIZE)
> > +			coresight_insert_barrier_packet(bufp);
> > +	}
> > +
> > +	return ret;
> 
> Instead,
> 
> 	return 0;
> 
> to keep it clear.

Ack.


> 
> > +}
> > +
> >   static int tmc_read_prepare(struct tmc_drvdata *drvdata)
> >   {
> >   	int ret = 0;
> > @@ -223,6 +341,77 @@ static const struct file_operations tmc_fops = {
> >   	.release	= tmc_release,
> >   };
> > +static int tmc_crashdata_open(struct inode *inode, struct file *file)
> > +{
> > +	unsigned long flags;
> > +	struct tmc_resrv_buf *rbuf;
> > +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> > +						   struct tmc_drvdata,
> > +						   crashdev);
> > +
> > +	rbuf = &drvdata->resrv_buf;
> > +
> > +	spin_lock_irqsave(&drvdata->spinlock, flags);
> 
> We should additionally verify that the "metadata->valid" is still set,
> because, a resrv_mode operation could clear it ? Or at the least set the
> size in the rbuf to 0 when we use the RESRV mode, so we don't expose any
> data that was written in the RESRV mode.

Okay Agree. Will fix this. Thanks for pointing this out.



> 
> > +	rbuf->reading = true;
> > +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> > +
> > +	nonseekable_open(inode, file);
> > +
> > +	dev_dbg(&drvdata->csdev->dev, "%s: successfully opened\n", __func__);
> > +	return 0;
> > +}
> > +
> > +static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
> > +				  size_t len, loff_t *ppos)
> > +{
> > +	char *bufp;
> > +	ssize_t actual;
> > +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> > +						   struct tmc_drvdata,
> > +						   crashdev);
> > +
> > +	actual = tmc_get_resvbuf_trace(drvdata, *ppos, len, &bufp);
> > +	if (actual <= 0)
> > +		return 0;
> > +
> > +	if (copy_to_user(data, bufp, actual)) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"%s: copy_to_user failed\n", __func__);
> > +		return -EFAULT;
> > +	}
> > +
> > +	*ppos += actual;
> > +	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
> > +
> > +	return actual;
> > +
> > +}
> > +
> > +static int tmc_crashdata_release(struct inode *inode, struct file *file)
> > +{
> > +	int ret = 0;
> > +	unsigned long flags;
> > +	struct tmc_resrv_buf *rbuf;
> > +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> > +						   struct tmc_drvdata,
> > +						   crashdev);
> > +
> > +	rbuf = &drvdata->resrv_buf;
> > +	spin_lock_irqsave(&drvdata->spinlock, flags);
> > +	rbuf->reading = false;
> > +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> > +
> > +	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
> > +	return ret;
> > +}
> > +
> > +static const struct file_operations tmc_crashdata_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= tmc_crashdata_open,
> > +	.read		= tmc_crashdata_read,
> > +	.release	= tmc_crashdata_release,
> > +};
> > +
> >   static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
> >   {
> >   	enum tmc_mem_intf_width memwidth;
> > @@ -532,6 +721,20 @@ static u32 tmc_etr_get_max_burst_size(struct device *dev)
> >   	return burst_size;
> >   }
> > +static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
> > +					 const char *name)
> > +{
> > +	drvdata->crashdev.name =
> > +		devm_kasprintf(&drvdata->csdev->dev, GFP_KERNEL, "%s_%s", "crash", name);
> > +	drvdata->crashdev.minor = MISC_DYNAMIC_MINOR;
> > +	drvdata->crashdev.fops = &tmc_crashdata_fops;
> > +	if (misc_register(&drvdata->crashdev)) {
> > +		dev_dbg(&drvdata->csdev->dev,
> > +			"Failed to setup user interface for crashdata\n");
> > +		drvdata->crashdev.fops = NULL;
> > +	}
> > +}
> > +
> >   static int __tmc_probe(struct device *dev, struct resource *res)
> >   {
> >   	int ret = 0;
> > @@ -632,9 +835,15 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >   	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
> >   	drvdata->miscdev.fops = &tmc_fops;
> >   	ret = misc_register(&drvdata->miscdev);
> > -	if (ret)
> > +	if (ret) {
> >   		coresight_unregister(drvdata->csdev);
> > +		goto out;
> > +	}
> > +
> >   out:
> > +	if (is_tmc_crashdata_valid(drvdata) &&
> > +	    !tmc_prepare_crashdata(drvdata))
> > +		register_crash_dev_interface(drvdata, desc.name);
> >   	return ret;
> >   }
> > @@ -687,6 +896,8 @@ static void __tmc_remove(struct device *dev)
> >   	 * handler to this device is closed.
> >   	 */
> >   	misc_deregister(&drvdata->miscdev);
> > +	if (drvdata->crashdev.fops)
> > +		misc_deregister(&drvdata->crashdev);
> >   	coresight_unregister(drvdata->csdev);
> >   }
> > diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > index fb944a68a11c..0ca01d5c9581 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > @@ -2012,6 +2012,26 @@ static ssize_t buf_mode_preferred_show(struct device *dev,
> >   	return sysfs_emit(buf, "%s\n", buf_modes_str[drvdata->etr_mode]);
> >   }
> > +static int buf_mode_set_resrv(struct tmc_drvdata *drvdata)
> > +{
> > +	int err = 0;
> 
> minor nit:
> 
> 	int err = -EBUSY;

Ack.

> 
> > +	unsigned long flags;
> > +	struct tmc_resrv_buf *rbuf;
> > +
> > +	rbuf = &drvdata->resrv_buf;
> > +
> > +	/* Ensure there are no active crashdata read sessions */
> > +	spin_lock_irqsave(&drvdata->spinlock, flags);
> > +	if (!rbuf->reading) {
> > +		tmc_crashdata_set_invalid(drvdata);
> 
> See my comment above.  We don't seem to be checking this "after" we created
> the crash device file. But it is right to do so. May be additionally set the
> rbuf->len = 0 too ?

Yes, agree. Will fix this. Will do some negative tests to verify this.


> 
> Another question, what happens if :
> 
> 1) First boot - Crash data was captured, watchdog timer booted us into
> second kernel.
> 2) In the Second Kernel, no crash, but normal/kexec reboot to a 3rd kernel
> 3) 3rd Kernel booted with Trace Data still in tact.
> 
> I don't know if there is a reliable way to clear out the trace capture. I
> guess it doesn't matter if the 3rd kernel sees a "kernel trace" from 1st
> kernel.


If there is a kernel panic/watchdog reset with coresight trace enabled,
some user space scripts in the subsequent boot is always expected to
read and copy the crash data into a storage space with appropriate
tag like timestamp or kernel version. May be we could add this as a note
in the documentation ?


Yeah, currently we dont have any user option to mark the trace capture
as invalid.

> 
> Do we need any additional information in the metadata header to indicate
> which kernel/time the crash was captured.

Adding the timestamp in the metadata is definitely an option in case if
we want to have less dependency on the user space scripts. But one basic
issue is that in case of watchdog reset, (SCP)firmware may not be able to add 
kernel version info /the wallclock timestamp if it doesnt have RTC support
though its easier for the kernel to update the timestamp/kernel version info.

Also if we decide to add time stamp, we need to expose the crash metadata to user
space as well may be using some sysfs interface.

IMHO,if we are relying on user space scripts to associate the crash data
with crashed kernels, then we dont have to add the time stamp/kernel
version. Userspace scripts can ensure that coresight trace is always saved on
a subsequent successful boot.
 

> Should we advertise the presence of a "crash" trace with a bit more of

Sure, will add a dev_info print whenever there is crashdata.

> importance at probe ? May be yes and then ignore a persisting trace from
> crash and leave it to the user to figure out.

IMO, we can leave it to the user to manage this, since user always have
the option of reenabling the coresight trace only if the last crashdata is
successfully saved. For example, if saving a valid crashdata and
starting the coresight trace is handled by some early init scripts.


Please let me your further thoughts on this.



> 
> 
> > +		drvdata->etr_mode = ETR_MODE_RESRV;
> 		err = 0;
> 	}
> 
> > -
> > -	} else
> > -		err = -1;
> 
> Remove ^^

Ack.

> 
> > +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> > +	return err;
> > +}
> > +
> >   static ssize_t buf_mode_preferred_store(struct device *dev,
> >   					  struct device_attribute *attr,
> >   					  const char *buf, size_t size)
> > @@ -2027,7 +2047,7 @@ static ssize_t buf_mode_preferred_store(struct device *dev,
> >   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_CATU]) && buf_hw.has_catu)
> >   		drvdata->etr_mode = ETR_MODE_CATU;
> >   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_RESRV]) && buf_hw.has_resrv)
> > -		drvdata->etr_mode = ETR_MODE_RESRV;
> > +		return buf_mode_set_resrv(drvdata) ? -EBUSY : size;
> 
> 		return buf_mode_set_resrv(drvdata) ? : size;
> 
> Suzuki
> 
> >   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_AUTO]))
> >   		drvdata->etr_mode = ETR_MODE_AUTO;
> >   	else
> > diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> > index d76e83fc840b..e3707b69abff 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc.h
> > +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> > @@ -195,11 +195,17 @@ struct etr_buf {
> >    * @paddr	: Start address of reserved memory region.
> >    * @vaddr	: Corresponding CPU virtual address.
> >    * @size	: Size of reserved memory region.
> > + * @offset	: Offset of the trace data in the buffer for consumption.
> > + * @reading	: Flag to indicate if reading is active
> > + * @len	: Available trace data @buf (may round up to the beginning).
> >    */
> >   struct tmc_resrv_buf {
> >   	phys_addr_t     paddr;
> >   	void		*vaddr;
> >   	size_t		size;
> > +	unsigned long	offset;
> > +	bool		reading;
> > +	s64		len;
> >   };
> >   /**
> > @@ -208,6 +214,8 @@ struct tmc_resrv_buf {
> >    * @base:	memory mapped base address for this component.
> >    * @csdev:	component vitals needed by the framework.
> >    * @miscdev:	specifics to handle "/dev/xyz.tmc" entry.
> > + * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
> > + *		crash tracedata.
> >    * @spinlock:	only one at a time pls.
> >    * @pid:	Process ID of the process that owns the session that is using
> >    *		this component. For example this would be the pid of the Perf
> > @@ -227,7 +235,7 @@ struct tmc_resrv_buf {
> >    * @idr_mutex:	Access serialisation for idr.
> >    * @sysfs_buf:	SYSFS buffer for ETR.
> >    * @perf_buf:	PERF buffer for ETR.
> > - * @resrv_buf:	Used by ETR as hardware trace buffer and for trace data
> > + * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
> >    *		retention (after crash) only when ETR_MODE_RESRV buffer
> >    *		mode is enabled. Used by ETF for trace data retention
> >    *		(after crash) by default.
> > @@ -239,6 +247,7 @@ struct tmc_drvdata {
> >   	void __iomem		*base;
> >   	struct coresight_device	*csdev;
> >   	struct miscdevice	miscdev;
> > +	struct miscdevice	crashdev;
> >   	spinlock_t		spinlock;
> >   	pid_t			pid;
> >   	bool			reading;
> > @@ -309,6 +318,8 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
> >   void tmc_enable_hw(struct tmc_drvdata *drvdata);
> >   void tmc_disable_hw(struct tmc_drvdata *drvdata);
> >   u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
> > +int tmc_read_prepare_crashdata(struct tmc_drvdata *drvdata);
> > +int tmc_read_unprepare_crashdata(struct tmc_drvdata *drvdata);
> >   /* ETB/ETF functions */
> >   int tmc_read_prepare_etb(struct tmc_drvdata *drvdata);
> > @@ -371,6 +382,7 @@ void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
> >   				  u64 offset, u64 size);
> >   ssize_t tmc_sg_table_get_data(struct tmc_sg_table *sg_table,
> >   			      u64 offset, size_t len, char **bufpp);
> > +
> >   static inline unsigned long
> >   tmc_sg_table_buf_size(struct tmc_sg_table *sg_table)
> >   {
> 
> 
