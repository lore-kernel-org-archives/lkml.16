Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E02114
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105959; cv=none; b=gqNsS3U4VD5vrHVEpJf3iy53A7sZCF0qwp2EQLwEdnxCh4xlw0LOgca1kbMRpaLD0eHYUe26Yifr0+5tWzYWTK/+Rmf6I+GurNCOdDFFxABmwMrUlbmTJfDnbm4qHLyNeNfI2ycHnwfdSLbSm5SXZo398R2Rmulnz+j58xuvWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105959; c=relaxed/simple;
	bh=cyduzTdGidhSuuj7X92xRstIuhvQeMVv9pQcr2FaBIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHlNvvk4VlriR2rPsYFDdkztFuRtccczPDHf9ugNsqv1ITN7G1v9p7rJgWORmQIxaBxHNTFbwFnzyiVJoHGYDZ7kk1pYEhi4NiqztTy3rxXnN/Cwd6lDAUgl2tz6xM3S8As0azhUuFJPl7TMVhtpzykKnMo2LxMcpljH6ySreYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCTFx4wH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCTFx4wH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AFAC4CEE7;
	Thu,  5 Jun 2025 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749105959;
	bh=cyduzTdGidhSuuj7X92xRstIuhvQeMVv9pQcr2FaBIU=;
	h=Date:From:To:Cc:Subject:From;
	b=PCTFx4wHgqGTWPOLIP3vBHiWOoqIWpr5+wJ7lKMPVxP03gDDn7nbgZWHdGU/WqMPF
	 5srLqbTz4+dq8Mrq6dhEv1deQfE0tkZcLZZeS29H87+zczcYa0fTrAOrvmm2EZCSzD
	 HcoWX3IWU885bdG8auINWOrxh7CHKDwd+fX3nfLlq8SsAqtAFCygw/XR9SNrBxjz6p
	 LeHL9mYJXqHKyJg2a0+EHUrrWnnZeAx2B6G0zEASnoL0U8jZLy50QaGX8DIXnWtVlg
	 ORkzwEZ1TEiezjdAzAh24HFDSeIO0ALKGHVjX3JBdk5LvJESdoWgF3xxDFHOWxSXRB
	 5hOTxJDgwQj2w==
Date: Thu, 5 Jun 2025 12:15:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Soundwire updates for v6.16
Message-ID: <aEE9IwuPcjYyMSLu@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AvpxzHzZNNLAKbFV"
Content-Disposition: inline


--AvpxzHzZNNLAKbFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive a small pull request for soundwire subsystem for
v6.16. This includes couple of core changes and an Intel driver change.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-6.16-rc1

for you to fetch changes up to 62ada17a6217a50fbd1b23f10899890f56effc97:

  soundwire: only compute port params in specific stream states (2025-05-14=
 12:44:01 +0100)

----------------------------------------------------------------
soundwire updates for 6.16

Couple of small core changes for
 - sdw_assign_device_num() logic simplification, using internal slave id
   for irqs and optimizing computing of port params in specific stream
   states
 - Intel driver updates for ACE3+ microphone privacy status reporting
   and enabling the status in HDA Intel driver

----------------------------------------------------------------
Bard Liao (1):
      soundwire: only compute port params in specific stream states

Charles Keepax (2):
      soundwire: bus: Simplify sdw_assign_device_num()
      soundwire: bus: Add internal slave ID and use for IRQs

Peter Ujfalusi (2):
      soundwire: intel: Add awareness of ACE3+ microphone privacy
      ASoC: SOF: Intel: hda: Set the mic_privacy flag for soundwire with AC=
E3+

 drivers/soundwire/bus.c                          | 31 +++++++++++---------=
----
 drivers/soundwire/bus_type.c                     | 10 ++++++++
 drivers/soundwire/generic_bandwidth_allocation.c |  7 ++++++
 drivers/soundwire/intel.h                        |  2 ++
 drivers/soundwire/intel_ace2x_debugfs.c          |  6 +++++
 drivers/soundwire/intel_init.c                   |  1 +
 drivers/soundwire/irq.c                          |  6 ++---
 include/linux/soundwire/sdw.h                    |  6 +++++
 include/linux/soundwire/sdw_intel.h              |  5 ++++
 sound/soc/sof/intel/hda.c                        |  3 +++
 10 files changed, 57 insertions(+), 20 deletions(-)

--=20
~Vinod

--AvpxzHzZNNLAKbFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmhBPSMACgkQfBQHDyUj
g0dLsBAAozrJNeiebA+OTagpdFOL3af4AB0C4z/rGf9xSZiEBdkAuw0ByaS/NoqK
660icxrshrnPLcqdifhWQSiys/q864zfdsoQOKz2MXZPSKMZjDzxKYQ9lEJ3N34Q
OPbuu3xhgymZeirgkNn//C/vd3/Z4PYoQosBDxKmGJa8uxqc0DdJR17eiexNYmDB
jOZqDe3BtI9URD8WbgYzp8wp8ZyIRtkPThdh6aIeTr8NZRG2am2G1aJHQToWnmE8
b4uP3rBhtc1O4sQe22VrRClPFynwxevDp/VqlfyQ6B81YrFjEc93L6WHh/wtJL0+
tCgTIDZ5XyCPpeYRcmqIP2od2ffhvBuCDUX9MCAWftmsyacCbqd3ResQjjfdkNsx
r/MpHCS2EeJnHQwQMxdzCNGBIjtzu2IZhZR/3IUctsqyQ/CRgt7899lGZZ3mk0DQ
kJ0+ucep5VPH80VBT8hS18zv0MzkULziVloCC0KLOOK3BNnfFSd2b/nu363iPZ8T
CroFQKkUwElXOgKeAjo8SBYJ0XqlY14+Okq4dPBaw/N7EcHOMhWlJvd2Q+RtwWj3
3wehYbQ8QCLpG0QIrxzm5YY7Oo0q0Jj/BOOU5JY9kGvSVFQXaUqOyovdKI4jGwyr
1c6fTcZd8eT0DCTbisWlZLy6TNACz8vxcuZXyuAJLGGCav+anIY=
=y68A
-----END PGP SIGNATURE-----

--AvpxzHzZNNLAKbFV--
