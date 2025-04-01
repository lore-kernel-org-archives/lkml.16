Received: from mail.cab.de (mail.cab.de [46.232.229.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9220408C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.229.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514975; cv=none; b=ZAiZhqh08CY0U+0zbvd2VyvWRmV0281iqHi/B8PtyiYvUyubhV5MdIS8KgI/ne/zGm238oJ5Kd9HOyg6jhy8TVbTz4onXchH8c2pmtdIOG+gU4Ijifc2ZmXIy6B0kOjJcDnuLGUdqVGku2gZMi7d+MeLRiqRUhd1kKb6crEaMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514975; c=relaxed/simple;
	bh=hCkca38QdSmhO6cjGfNf7pfjb4NUxK6bwuRScCq8GiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CDZmZwQxZPaUJwTmIGYAYEE0AlCVaXA0JJDZ7flRxw1dVb+qF4KQm4q05PLkaDRN29vZUrejg13zl7pTv8OeIqExbIquCTAthbMUEUezCacwHTGFxJp/AkuoTMA63o/+q3S9HUXkcnNvyC2+Wwx2uqdNW+K32u184+koltb6peY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b=QJI3+YKp; arc=none smtp.client-ip=46.232.229.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b="QJI3+YKp"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZRppv3PwBzMvb0G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; s=default;
	t=1743514391; bh=1jAXo92M2vDykbLqik4FdebMpzLAgChBKSnJhUXHPI8=;
	h=From:To:CC:Subject:Date:From;
	b=QJI3+YKpeCZ3qjvgXHPZg2lZYfr27+Ac86OoDEYPbabldeuaYkZw/qnOQHu4R9L2z
	 CZN3y8f+n/nrrsg8cSbSdINVIYBSc/FCCHApBxVcAMhB7a7v4m1xCeW3ltXlSJgWqw
	 WVNL+f+ruFegvGqL9ScwsSlpogVGOHGVmt1fBvTc=
X-cab-MailScanner-Watermark: 1744119190.42409@Z+ageB+9BNAKE10EAT91yg
X-cab-MailScanner-From: m.heidelberg@cab.de
X-cab-MailScanner: Found to be clean
X-cab-MailScanner-ID: 4ZRpps0WDGzMvb08
X-cab-MailScanner-Information: Please contact it@cab.de for more information
Received: from Adranos.cab.de ([10.10.1.54] [10.10.1.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(no client certificate requested)
	by hephaistos.cab.de (MailScanner Milter) with SMTP id 4ZRpps0WDGzMvb08;
	Tue,  1 Apr 2025 15:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZRpps0WDGzMvb08
Received: from KAN23-025.cab.de (10.10.3.178) by Adranos.cab.de (10.10.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Apr
 2025 15:33:17 +0200
From: Markus Heidelberg <m.heidelberg@cab.de>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian
 Eggers <ceggers@arri.de>
CC: Markus Heidelberg <m.heidelberg@cab.de>, Jiri Prchal
	<jiri.prchal@aksignal.cz>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without device ID
Date: Tue, 1 Apr 2025 15:30:46 +0200
Message-ID: <20250401133148.38330-1-m.heidelberg@cab.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Adranos.cab.de (10.10.1.54) To Adranos.cab.de (10.10.1.54)

Hello,

this patch series is marked as RFC because I'm unsure if it
should rather be implemented with an adaption in this binding:

  Documentation/devicetree/bindings/eeprom/at25.yaml

Currently supported FRAMs use compatible="cypress,fm25","atmel,at25" in
Devicetree, the memory size is read from its device ID.
For FRAMs without device ID this is not possible, so the "size" property
has to be set manually as it is done for EEPROMs.

I had a few solutions for implementation in mind, but opted for the
simplest one as base for discussion:

- Use the existing "compatible" string and additionally set "size". Only
  read the device ID if "size" is not set.

  But this way there is already the problem that "size" is required for
  FRAMs without device ID, but I cannot specify that in the binding
  because of the reused "compatible" string.

Other ideas that came to mind:

- Add "cypress,fm25l16b" (chip is named FM25L16B) and define "size" as
  required property. Use that instead of "cypress,fm25".

  According to Documentation/devicetree/bindings/writing-bindings.rst
  this might even be necessary regarding this statement:

    "DO add new compatibles in case there are new features or bugs."

  The existing "cypress,fm25" ("FM25" is not the real name of a chip,
  but the common prefix) also doesn't seem chosen right regarding this
  statement:

    "DO make ‘compatible’ properties specific. DON'T use wildcards in
    compatible strings."

- Add a boolean property "no-device-id" to the existing "compatible"
  string and in case this boolean is set, define "size" as required.

  This seems a bit awkward at first sight. Also, would this really solve
  the above mentioned problem with specification of the binding?

Bye!

Markus Heidelberg (2):
  eeprom: at25: support Cypress FRAMs without device ID
  eeprom: at25: make FRAM device ID error message more precise

 drivers/misc/eeprom/at25.c | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

-- 
2.43.0


