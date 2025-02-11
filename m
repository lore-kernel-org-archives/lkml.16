Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12061EC014;
	Tue, 11 Feb 2025 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259189; cv=none; b=LP5L9GZaanP1HbERL4fUh7aISXJg51c6YhxrcnqTtbqFvPqW2XXZEOQWbo7c6/IUGBMS3cuF1kPX3KHoBWsDAzr0xAWJzGRihTDzS5d8ARpQqyvvhpg17XUhBVErDFnqGslnLanegrsdzjRoEtDcF3s1xR8KKOdVcpwdu5zoLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259189; c=relaxed/simple;
	bh=INzW46XiHvA0wnEotgLP6+uIuE8J9I0BBiAkjY2w2rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+CS3fTorhg2EPZ4Sspmqzwi0v0YMHsmOvBoPrCgnim/a2NlIYxfS3JQFCLsmYZQ0Rz6PuY3sL2ag3AWyYeZldexiAwsWYqy8JPEWlbHJYBDGYlT7mlolhxbXL/h0hxZRYCgUf0V6tlAh8GX2O642YIcgZR8PqO8xpjSUmuE1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=clVPhsPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="clVPhsPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06222C4CEE6;
	Tue, 11 Feb 2025 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739259188;
	bh=INzW46XiHvA0wnEotgLP6+uIuE8J9I0BBiAkjY2w2rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clVPhsPn6svCF1qJwFVXs3KNBNyk6RRbXdOc5AciWtXsys50DYBYNSC+lo8Wfnd3G
	 pGGdktreBJgG5RYykIGJ1KOBMq4lFt1khgSdvHIVi1/wpL7MWrGp2IUWdbijwz6sdB
	 pAxXQK3qhfjMBaz0fayneOxWDHyefkgALmhWzVbY=
Date: Tue, 11 Feb 2025 08:33:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025021113-hundredth-pandemic-4529@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OYKAYV14AZ.2D8Q4XP557FSR@gmail.com>
 <2025021111-landowner-gleaming-5971@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021111-landowner-gleaming-5971@gregkh>

On Tue, Feb 11, 2025 at 08:27:26AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 10, 2025 at 12:56:46PM -0500, Kurt Borja wrote:
> I'll work on adding "if probe failed, don't let the device be created"
> logic as it's a simple change, BUT it is a functionally different change
> from what the current api that this code is replacing is doing (i.e. the
> current platform device creation code does this today and no one has
> ever hit this in their use of it in the past few decades.)

How about something as simple as this change, does that provide what you
are thinking about here?  Only compile tested, not runtime tested at
all:


diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 531e9d789ee0..e2de0697c0e3 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -25,6 +25,7 @@
 struct faux_object {
 	struct faux_device faux_dev;
 	const struct faux_device_ops *faux_ops;
+	bool probe_was_successful;
 };
 #define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
 
@@ -48,6 +49,9 @@ static int faux_probe(struct device *dev)
 	if (faux_ops && faux_ops->probe)
 		ret = faux_ops->probe(faux_dev);
 
+	if (!ret)
+		faux_obj->probe_was_successful = true;
+
 	return ret;
 }
 
@@ -147,6 +151,15 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 		return NULL;
 	}
 
+	/*
+	 * The probe callback will set probe_was_successful if it
+	 * succeeded, if not, then we need to tear things down here
+	 */
+	if (!faux_obj->probe_was_successful) {
+		faux_device_destroy(faux_dev);
+		return NULL;
+	}
+
 	return faux_dev;
 }
 EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
