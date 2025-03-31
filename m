Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D213D8A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406357; cv=none; b=gssyBFgI0a8U8dlLWo7CLEqi51YcwY8hrtlgoM2Anm0MJIw++HdUwYK5nL9uVLK9GFTU/hI1PBO6AIk69vSPrwzt2fjGBsOmnHJVowmKlBntSGxGLFxq4Z710OUZAHRUUYx7uztsd4NN6kFvl9dwYBOQgxLK6p7URb0YpikGS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406357; c=relaxed/simple;
	bh=9eDJV+Q42SpTgbURCjBSTWK3cbfRQb7kV882FSDhJY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZJHwWdJur7ExJgKxUFlvpJeJsYLG/iJNhPh4Yi44mtG85MdcOmFG0nqz0bHtWOOdi4SJ+sAG8GFxPUTCtCpno0OT2MeOfEyZZXenD/jDIBhLg7HUrj342BijzI1AObSWq7wMbWxsUNy7n/iDjTI1s6QiUNMagj2TBzCuU61eRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haaPner3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haaPner3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEC2C4CEE3;
	Mon, 31 Mar 2025 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406356;
	bh=9eDJV+Q42SpTgbURCjBSTWK3cbfRQb7kV882FSDhJY0=;
	h=Date:From:To:Cc:Subject:From;
	b=haaPner3iJGPqZQ5vk/zlwmT3ltbUJok8nCBYSql6i89eRRPMNysvTj/NCCfgzqxh
	 9/X74rgrsx8vfsZo9EWwkaDpl1RF7QP6/fN0f9pyjkJPsPyJseYXoNcUZGHaCylHTt
	 hazZ4K9Oloq6UnIiGiBCHJ63AVVQLj9PcA/S6Ej3gnu70b/j34jgKZooLt2vnAYpH7
	 eRQBCWhMS8Mu213utI2/TP7Oc0VfKpZ8mK8kQ62icBcXGU8LihRL7p0tU2RULH7p0Q
	 7lW9e986Kau2pECmGTaYE1GNi3UhjSA/uU3RhX1kiHNVFKHu1s1iBA7aKjhOWW+mSv
	 uUAfy31pwlmRg==
Date: Mon, 31 Mar 2025 13:02:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: soundwire subsystem updates for 6.15
Message-ID: <Z+pFD/OXH3Nnt6gS@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tBvx4Ku139DxYpYm"
Content-Disposition: inline


--tBvx4Ku139DxYpYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull the soundwire subsystem updates which consist mainly of SoundWi=
re Bulk Register
Access (BRA) and AMD driver new platform support along with minor driver
updates everywhere.


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-6.15-rc1

for you to fetch changes up to 08ae0d61c3d79bb5d52ae30ad4fc12442e966a23:

  soundwire: take in count the bandwidth of a prepared stream (2025-03-11 0=
1:51:58 +0530)

----------------------------------------------------------------
soundwire updates for 6.15

 - Support for SoundWire Bulk Register Access (BRA) protocol in core
   along with Intel driver support and ASoC bits required.
 - AMD driver updates and support for ACP 7.0 and 7.1 platforms

----------------------------------------------------------------
Bard Liao (4):
      soundwire: cadence_master: set frame shape and divider based on actua=
l clk freq
      soundwire: Revert "soundwire: intel_auxdevice: start the bus at defau=
lt frequency"
      ASoC: SOF: Intel: hda-sdw-bpt: add CHAIN_DMA support
      soundwire: take in count the bandwidth of a prepared stream

Joe Hattori (1):
      soundwire: slave: fix an OF node reference leak in soundwire slave de=
vice

Krzysztof Kozlowski (1):
      soundwire: Use str_enable_disable-like helpers

Pierre-Louis Bossart (15):
      Documentation: driver: add SoundWire BRA description
      soundwire: cadence: add BTP support for DP0
      soundwire: extend sdw_stream_type to BPT
      soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
      soundwire: stream: special-case the bus compute_params() routine
      soundwire: stream: reuse existing code for BPT stream
      soundwire: bus: add send_async/wait APIs for BPT protocol
      soundwire: bus: add bpt_stream pointer
      soundwire: cadence: add BTP/BRA helpers to format data
      soundwire: intel_auxdevice: add indirection for BPT send_async/wait
      ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA
      soundwire: intel: add BPT context definition
      soundwire: intel_ace2x: add BPT send_async/wait callbacks
      soundwire: debugfs: add interface for BPT/BRA transfers
      ASoC: rt711-sdca: add DP0 support

Vijendar Mukunda (7):
      soundwire: amd: change the soundwire wake enable/disable sequence
      soundwire: amd: add debug log for soundwire wake event
      soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
      soundwire: amd: set device power state during suspend/resume sequence
      soundwire: amd: set ACP_PME_EN during runtime suspend sequence
      soundwire: amd: add soundwire host wake interrupt enable/disable sequ=
ence
      soundwire: amd: change the log level for command response log

 Documentation/driver-api/soundwire/bra.rst         | 336 +++++++++++
 Documentation/driver-api/soundwire/bra_cadence.rst |  66 ++
 Documentation/driver-api/soundwire/index.rst       |   2 +
 Documentation/driver-api/soundwire/stream.rst      |   2 +-
 Documentation/driver-api/soundwire/summary.rst     |   8 -
 drivers/soundwire/Kconfig                          |   1 +
 drivers/soundwire/amd_manager.c                    | 153 ++++-
 drivers/soundwire/amd_manager.h                    |  26 +
 drivers/soundwire/bus.c                            |  48 +-
 drivers/soundwire/bus.h                            |  18 +
 drivers/soundwire/cadence_master.c                 | 668 +++++++++++++++++=
+++-
 drivers/soundwire/cadence_master.h                 |  20 +
 drivers/soundwire/debugfs.c                        |  91 ++-
 drivers/soundwire/generic_bandwidth_allocation.c   |  53 +-
 drivers/soundwire/intel.h                          |  23 +
 drivers/soundwire/intel_ace2x.c                    | 312 ++++++++++
 drivers/soundwire/intel_auxdevice.c                |  45 +-
 drivers/soundwire/slave.c                          |   1 +
 drivers/soundwire/stream.c                         | 143 +++--
 include/linux/soundwire/sdw.h                      |  33 +-
 include/linux/soundwire/sdw_amd.h                  |   2 +
 include/linux/soundwire/sdw_intel.h                |   4 +
 include/sound/hda-sdw-bpt.h                        |  69 +++
 sound/soc/codecs/rt711-sdca-sdw.c                  |   8 +
 sound/soc/qcom/sdw.c                               |   2 +-
 sound/soc/sof/intel/Kconfig                        |   7 +
 sound/soc/sof/intel/Makefile                       |   4 +
 sound/soc/sof/intel/hda-sdw-bpt.c                  | 445 ++++++++++++++
 28 files changed, 2487 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/driver-api/soundwire/bra.rst
 create mode 100644 Documentation/driver-api/soundwire/bra_cadence.rst
 create mode 100644 include/sound/hda-sdw-bpt.h
 create mode 100644 sound/soc/sof/intel/hda-sdw-bpt.c

--=20
~Vinod

--tBvx4Ku139DxYpYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmfqRQ8ACgkQfBQHDyUj
g0cT5A/+KjK4rrOS9LVYx1JMa8KasYu6Tb+cpoTblBChJ/OxzReqQ1B6NQLLtQGE
R276OloAiXGjdSU2hZE2r5s6k7EweogGZj3EfqJDeesf84ks1N8AXppgaClYzZ+a
3Ho/HFx/gxRI4cPRpYN2MmODovzSdwceUyvjAmKLishwvdmsz9X22YARv5poiolH
q1gn0k47tJnXxoBt9xUSXOfEAbhb12PPt/GFcTGfEYw7go6oZA36NPcO1dBD5Y/X
8fqJLzzX3vWmVEni/MsiW7qpc7JKFaPnAKeoBJQxDwaJ7y5Pn3RAlw76bV/J8IiQ
8aBVsVrx+7kuU6qeATUzmNuFX5rXHaXvudd/WPgKSwGpJAaV9xNar9LBHsMAfht1
H+nQGCPJtlumSEbs6ow8RenOO1mEGVyywrAMaD7dAYgYSuW2VinzIeUCPwtM9vlE
e1St+ygdbwIemcX09fGkoFIGYJH7u9x4de/XRvICb02YFA2CRndN3ZM/N+P/IdVG
AyoZT0rkD2Oun8f37fUZaV6TRLKHg1lS6MROxxkwwTBlyWYT6Viwtzum8vfh4Qo6
iBqDFN8mBSeYgYwZ62nHHtl2/FqvLEANm1KlXOyym6Z+WviK0IRZ19/3C2+ihxA/
5OzL+1z4MJOvXT89+sj4mFAyapOaIqSLRzUdnpZ+tm6T3cVjBy8=
=51ZZ
-----END PGP SIGNATURE-----

--tBvx4Ku139DxYpYm--
