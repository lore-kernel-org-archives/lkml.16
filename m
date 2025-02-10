Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4ED1DE4CE;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=ixhbPmvKVJEHPs55lm5oFzrwXXsRYVHf+fXgdY2rT25trGC0HfA1hj2XuK+pW6Wu2yTrSdV7ImLuDOGAimu7Zn8OFT6gWfinZiJOu0fVtJ+JZ03oC15aJB8TJbRN+tC/cY/f5WkApaxOCi2ICf1SREBtxJOHx3KdJs1l89mLGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=IicVwLTuB76oueVrS4jhShL6OGXHV7R7qLE2HyzTv7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcJjY1UfGH5eEKkVPBK+rPpFzd2VV/t0pU/EM9sm1rJe+3AmjZArP+sHlAR9Wi/u7CfnPvGNL7Hnx2JeGfJUMJv3C84PRMFrhByB9jaoQHso6urW5BsP3Afsokc9vIR4ppk4GMxBRcpDGWZludxN/ppjZvLI8zXvjG3NZ+IHb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5HdIb20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5HdIb20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF141C4CEF1;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=IicVwLTuB76oueVrS4jhShL6OGXHV7R7qLE2HyzTv7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5HdIb20+JWg+Kk+buxlZR1s9Z7RuLq0+diIj1rd7L+NByPQ3Qx+vDATNJIW/rl3q
	 24XMRsEBChzNjqNzpOoYkZK0mxTZ/299Z3H6jqnq+IvTtI495VBgNuZ66PkxwJsxuX
	 yROudgb9dRn/QFugR9auaVywYgVNxgydckqZjBFZd438iiQGkZskB3B8c5RLHiU1Lk
	 pzvPHnSer5m2vLGHiIbcewhl0blrKA6fmHIaRj7IK1/LGcQjY7wmv3a/ULFyXcRnHt
	 1vHscfYcW+1ZyZ9y6HbTGg5dqQKcNQ4I36kHXLWqgxckjdH0ppWVqgXWuI+qu+OZKm
	 0J42b2M7K7IGA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cim-0Wui;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/27] scripts/get_abi.py: add a Python tool to generate ReST output
Date: Mon, 10 Feb 2025 11:17:59 +0100
Message-ID: <71a894211a8b69664711144d9c4f8a0e73d1ae3c.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The get_abi.pl script is requiring some care, but it seems that
the number of changes on it since when I originally wrote it
was not too high.

Maintaining perl scripts without using classes requires a higher
efforted than on python, due to global variables management.
Also, it sounds easier to find python developer those days than
perl ones.

As a plus, using a Python class to handle ABI allows a better
integration with Sphinx extensions, allowing, for instance,
to let automarkup to generate cross-references for ABI
symbols.

With that in mind, rewrite the core of get_abi.pl in Python,
using classes, to help producing documentation. This will
allow a better integration in the future with the Sphinx
ABI extension.

The algorithms used there are the same as the ones in Perl,
with a couple of cleanups to remove redundant variables and
to help with cross-reference generation. While doing that,
remove some code that were important in the past, where
ABI files weren't using ReST format.

Some minor improvements were added like using a fixed seed
when generating ABI keys for duplicated names, making its
results reproductible.

The end script is a little bit faster than the original one
(tested on a machine with ssd disks). That's probably because
we're now using only pre-compiled regular expressions, and it
is using string replacement methods instead of regex where
possible.

The new version is a little bit more conservative when
converting text to cross-references to avoid adding them into
literal blocks.

To ensure that the ReST output is parsing all variables
and files properly, the end result was compared using diff
with the one produced by the perl script and showed no regressions.
There are minor improvements at the results, as it now
properly groups What on some special cases. It also better
escape some XREF names.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py            | 118 ++++++++
 scripts/lib/abi/abi_parser.py | 512 ++++++++++++++++++++++++++++++++++
 scripts/lib/abi/helpers.py    |  28 ++
 3 files changed, 658 insertions(+)
 create mode 100755 scripts/get_abi.py
 create mode 100644 scripts/lib/abi/abi_parser.py
 create mode 100644 scripts/lib/abi/helpers.py

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
new file mode 100755
index 000000000000..bb17c54feeff
--- /dev/null
+++ b/scripts/get_abi.py
@@ -0,0 +1,118 @@
+#!/usr/bin/env python3
+# pylint: disable=R0903
+# Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Parse ABI documentation and produce results from it.
+"""
+
+import argparse
+import logging
+import os
+import sys
+
+# Import Python modules
+
+LIB_DIR = "lib/abi"
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+
+sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
+
+from abi_parser import AbiParser                # pylint: disable=C0413
+from helpers import ABI_DIR, DEBUG_HELP         # pylint: disable=C0413
+
+# Command line classes
+
+
+REST_DESC = """
+Produce output in ReST format.
+
+The output is done on two sections:
+
+- Symbols: show all parsed symbols in alphabetic order;
+- Files: cross reference the content of each file with the symbols on it.
+"""
+
+class AbiRest:
+    """Initialize an argparse subparser for rest output"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("rest",
+                                       formatter_class=argparse.RawTextHelpFormatter,
+                                       description=REST_DESC)
+
+        parser.add_argument("--enable-lineno",  action="store_true",
+                            help="enable lineno")
+        parser.add_argument("--raw", action="store_true",
+                            help="output text as contained in the ABI files. "
+                                 "It not used, output will contain dynamically"
+                                 " generated cross references when possible.")
+        parser.add_argument("--no-file", action="store_true",
+                            help="Don't the files section")
+        parser.add_argument("--show-hints", help="Show-hints")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        parser = AbiParser(args.dir, debug=args.debug)
+        parser.parse_abi()
+        parser.check_issues()
+        parser.print_data(args.enable_lineno, args.raw, not args.no_file)
+
+
+class AbiValidate:
+    """Initialize an argparse subparser for ABI validation"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("validate",
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       description="list events")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        parser = AbiParser(args.dir, debug=args.debug)
+        parser.parse_abi()
+        parser.check_issues()
+
+
+def main():
+    """Main program"""
+
+    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter)
+
+    parser.add_argument("-d", "--debug", type=int, default=0, help="debug level")
+    parser.add_argument("-D", "--dir", default=ABI_DIR, help=DEBUG_HELP)
+
+    subparsers = parser.add_subparsers()
+
+    AbiRest(subparsers)
+    AbiValidate(subparsers)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        level = logging.DEBUG
+    else:
+        level = logging.INFO
+
+    logging.basicConfig(level=level, format="[%(levelname)s] %(message)s")
+
+    if "func" in args:
+        args.func(args)
+    else:
+        sys.exit(f"Please specify a valid command for {sys.argv[0]}")
+
+
+# Call main method
+if __name__ == "__main__":
+    main()
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
new file mode 100644
index 000000000000..b3fa70eee412
--- /dev/null
+++ b/scripts/lib/abi/abi_parser.py
@@ -0,0 +1,512 @@
+#!/usr/bin/env python3
+# pylint: disable=R0902,R0903,R0911,R0912,R0913,R0914,R0915,R0917,C0302
+# Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Parse ABI documentation and produce results from it.
+"""
+
+from argparse import Namespace
+import logging
+import os
+import re
+
+from glob import glob
+from pprint import pformat
+from random import randrange, seed
+
+# Import Python modules
+
+from helpers import AbiDebug, ABI_DIR
+
+
+class AbiParser:
+    """Main class to parse ABI files"""
+
+    TAGS = r"(what|where|date|kernelversion|contact|description|users)"
+    XREF = r"(?:^|\s|\()(\/(?:sys|config|proc|dev|kvd)\/[^,.:;\)\s]+)(?:[,.:;\)\s]|\Z)"
+
+    def __init__(self, directory, logger=None,
+                 enable_lineno=False, show_warnings=True, debug=0):
+        """Stores arguments for the class and initialize class vars"""
+
+        self.directory = directory
+        self.enable_lineno = enable_lineno
+        self.show_warnings = show_warnings
+        self.debug = debug
+
+        if not logger:
+            self.log = logging.getLogger("get_abi")
+        else:
+            self.log = logger
+
+        self.data = {}
+        self.what_symbols = {}
+        self.file_refs = {}
+        self.what_refs = {}
+
+        # Regular expressions used on parser
+        self.re_tag = re.compile(r"(\S+)(:\s*)(.*)", re.I)
+        self.re_valid = re.compile(self.TAGS)
+        self.re_start_spc = re.compile(r"(\s*)(\S.*)")
+        self.re_whitespace = re.compile(r"^\s+")
+
+        # Regular used on print
+        self.re_what = re.compile(r"(\/?(?:[\w\-]+\/?){1,2})")
+        self.re_escape = re.compile(r"([\.\x01-\x08\x0e-\x1f\x21-\x2f\x3a-\x40\x7b-\xff])")
+        self.re_unprintable = re.compile(r"([\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\xff]+)")
+        self.re_title_mark = re.compile(r"\n[\-\*\=\^\~]+\n")
+        self.re_doc = re.compile(r"Documentation/(?!devicetree)(\S+)\.rst")
+        self.re_abi = re.compile(r"(Documentation/ABI/)([\w\/\-]+)")
+        self.re_xref_node = re.compile(self.XREF)
+
+    def warn(self, fdata, msg, extra=None):
+        """Displays a parse error if warning is enabled"""
+
+        if not self.show_warnings:
+            return
+
+        msg = f"{fdata.fname}:{fdata.ln}: {msg}"
+        if extra:
+            msg += "\n\t\t" + extra
+
+        self.log.warning(msg)
+
+    def add_symbol(self, what, fname, ln=None, xref=None):
+        """Create a reference table describing where each 'what' is located"""
+
+        if what not in self.what_symbols:
+            self.what_symbols[what] = {"file": {}}
+
+        if fname not in self.what_symbols[what]["file"]:
+            self.what_symbols[what]["file"][fname] = []
+
+        if ln and ln not in self.what_symbols[what]["file"][fname]:
+            self.what_symbols[what]["file"][fname].append(ln)
+
+        if xref:
+            self.what_symbols[what]["xref"] = xref
+
+    def _parse_line(self, fdata, line):
+        """Parse a single line of an ABI file"""
+
+        new_what = False
+        new_tag = False
+        content = None
+
+        match = self.re_tag.match(line)
+        if match:
+            new = match.group(1).lower()
+            sep = match.group(2)
+            content = match.group(3)
+
+            match = self.re_valid.search(new)
+            if match:
+                new_tag = match.group(1)
+            else:
+                if fdata.tag == "description":
+                    # New "tag" is actually part of description.
+                    # Don't consider it a tag
+                    new_tag = False
+                elif fdata.tag != "":
+                    self.warn(fdata, f"tag '{fdata.tag}' is invalid", line)
+
+        if new_tag:
+            # "where" is Invalid, but was a common mistake. Warn if found
+            if new_tag == "where":
+                self.warn(fdata, "tag 'Where' is invalid. Should be 'What:' instead")
+                new_tag = "what"
+
+            if new_tag == "what":
+                fdata.space = None
+
+                if content not in self.what_symbols:
+                    self.add_symbol(what=content, fname=fdata.fname, ln=fdata.ln)
+
+                if fdata.tag == "what":
+                    fdata.what.append(content.strip("\n"))
+                else:
+                    if fdata.key:
+                        if "description" not in self.data.get(fdata.key, {}):
+                            self.warn(fdata, f"{fdata.key} doesn't have a description")
+
+                        for w in fdata.what:
+                            self.add_symbol(what=w, fname=fdata.fname,
+                                            ln=fdata.what_ln, xref=fdata.key)
+
+                    fdata.label = content
+                    new_what = True
+
+                    key = "abi_" + content.lower()
+                    fdata.key = self.re_unprintable.sub("_", key).strip("_")
+
+                    # Avoid duplicated keys but using a defined seed, to make
+                    # the namespace identical if there aren't changes at the
+                    # ABI symbols
+                    seed(42)
+
+                    while fdata.key in self.data:
+                        char = randrange(0, 51) + ord("A")
+                        if char > ord("Z"):
+                            char += ord("a") - ord("Z") - 1
+
+                        fdata.key += chr(char)
+
+                    if fdata.key and fdata.key not in self.data:
+                        self.data[fdata.key] = {
+                            "what": [content],
+                            "file": [fdata.file_ref],
+                            "line_no": fdata.ln,
+                        }
+
+                    fdata.what = self.data[fdata.key]["what"]
+
+                self.what_refs[content] = fdata.key
+                fdata.tag = new_tag
+                fdata.what_ln = fdata.ln
+
+                if fdata.nametag["what"]:
+                    t = (content, fdata.key)
+                    if t not in fdata.nametag["symbols"]:
+                        fdata.nametag["symbols"].append(t)
+
+                return
+
+            if fdata.tag and new_tag:
+                fdata.tag = new_tag
+
+                if new_what:
+                    fdata.label = ""
+
+                    self.data[fdata.key]["type"] = fdata.ftype
+
+                    if "description" in self.data[fdata.key]:
+                        self.data[fdata.key]["description"] += "\n\n"
+
+                    if fdata.file_ref not in self.data[fdata.key]["file"]:
+                        self.data[fdata.key]["file"].append(fdata.file_ref)
+
+                    if self.debug == AbiDebug.WHAT_PARSING:
+                        self.log.debug("what: %s", fdata.what)
+
+                if not fdata.what:
+                    self.warn(fdata, "'What:' should come first:", line)
+                    return
+
+                if new_tag == "description":
+                    fdata.space = None
+
+                    if content:
+                        sep = sep.replace(":", " ")
+
+                        c = " " * len(new_tag) + sep + content
+                        c = c.expandtabs()
+
+                        match = self.re_start_spc.match(c)
+                        if match:
+                            # Preserve initial spaces for the first line
+                            fdata.space = match.group(1)
+                            content = match.group(2) + "\n"
+
+                self.data[fdata.key][fdata.tag] = content
+
+            return
+
+        # Store any contents before tags at the database
+        if not fdata.tag and "what" in fdata.nametag:
+            fdata.nametag["description"] += line
+            return
+
+        if fdata.tag == "description":
+            content = line.expandtabs()
+
+            if self.re_whitespace.sub("", content) == "":
+                self.data[fdata.key][fdata.tag] += "\n"
+                return
+
+            if fdata.space is None:
+                match = self.re_start_spc.match(content)
+                if match:
+                    # Preserve initial spaces for the first line
+                    fdata.space = match.group(1)
+
+                    content = match.group(2) + "\n"
+            else:
+                if content.startswith(fdata.space):
+                    content = content[len(fdata.space):]
+
+                else:
+                    fdata.space = ""
+
+            if fdata.tag == "what":
+                w = content.strip("\n")
+                if w:
+                    self.data[fdata.key][fdata.tag].append(w)
+            else:
+                self.data[fdata.key][fdata.tag] += content
+            return
+
+        content = line.strip()
+        if fdata.tag:
+            if fdata.tag == "what":
+                w = content.strip("\n")
+                if w:
+                    self.data[fdata.key][fdata.tag].append(w)
+            else:
+                self.data[fdata.key][fdata.tag] += "\n" + content.rstrip("\n")
+            return
+
+        # Everything else is error
+        if content:
+            self.warn(fdata, "Unexpected content", line)
+
+    def parse_file(self, fname, path, basename):
+        """Parse a single file"""
+
+        ref = f"abi_file_{path}_{basename}"
+        ref = self.re_unprintable.sub("_", ref).strip("_")
+
+        # Store per-file state into a namespace variable. This will be used
+        # by the per-line parser state machine and by the warning function.
+        fdata = Namespace
+
+        fdata.fname = fname
+        fdata.name = basename
+
+        pos = fname.find(ABI_DIR)
+        if pos > 0:
+            f = fname[pos:]
+        else:
+            f = fname
+
+        fdata.file_ref = (f, ref)
+        self.file_refs[f] = ref
+
+        fdata.ln = 0
+        fdata.what_ln = 0
+        fdata.tag = ""
+        fdata.label = ""
+        fdata.what = []
+        fdata.key = None
+        fdata.xrefs = None
+        fdata.space = None
+        fdata.ftype = path.split("/")[0]
+
+        fdata.nametag = {}
+        fdata.nametag["what"] = [f"File {path}/{basename}"]
+        fdata.nametag["type"] = "File"
+        fdata.nametag["file"] = [fdata.file_ref]
+        fdata.nametag["line_no"] = 1
+        fdata.nametag["description"] = ""
+        fdata.nametag["symbols"] = []
+
+        self.data[ref] = fdata.nametag
+
+        if self.debug & AbiDebug.WHAT_OPEN:
+            self.log.debug("Opening file %s", fname)
+
+        with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
+            for line in fp:
+                fdata.ln += 1
+
+                self._parse_line(fdata, line)
+
+            if "description" in fdata.nametag:
+                fdata.nametag["description"] = fdata.nametag["description"].lstrip("\n")
+
+            if fdata.key:
+                if "description" not in self.data.get(fdata.key, {}):
+                    self.warn(fdata, f"{fdata.key} doesn't have a description")
+
+                for w in fdata.what:
+                    self.add_symbol(what=w, fname=fname, xref=fdata.key)
+
+    def parse_abi(self):
+        """Parse documentation ABI"""
+
+        ignore_suffixes = ("rej", "org", "orig", "bak", "~")
+        re_abi = re.compile(r".*" + ABI_DIR)
+
+        for fname in glob(os.path.join(self.directory, "**"), recursive=True):
+            if os.path.isdir(fname):
+                continue
+
+            basename = os.path.basename(fname)
+
+            if basename == "README":
+                continue
+            if basename.startswith(".") or basename.endswith(ignore_suffixes):
+                continue
+
+            path = re_abi.sub("", os.path.dirname(fname))
+
+            self.parse_file(fname, path, basename)
+
+        if self.debug & AbiDebug.DUMP_ABI_STRUCTS:
+            self.log.debug(pformat(self.data))
+
+    def print_desc_txt(self, desc):
+        """Print description as found inside ABI files"""
+
+        desc = desc.strip(" \t\n")
+
+        print(desc + "\n")
+
+    def print_desc_rst(self, desc):
+        """Enrich ReST output by creating cross-references"""
+
+        # Remove title markups from the description
+        # Having titles inside ABI files will only work if extra
+        # care would be taken in order to strictly follow the same
+        # level order for each markup.
+        desc = self.re_title_mark.sub("\n\n", "\n" + desc)
+        desc = desc.rstrip(" \t\n").lstrip("\n")
+
+        # Python's regex performance for non-compiled expressions is a lot
+        # than Perl, as Perl automatically caches them at their
+        # first usage. Here, we'll need to do the same, as otherwise the
+        # performance penalty is be high
+
+        new_desc = ""
+        for d in desc.split("\n"):
+            if d == "":
+                new_desc += "\n"
+                continue
+
+            # Use cross-references for doc files where needed
+            d = self.re_doc.sub(r":doc:`/\1`", d)
+
+            # Use cross-references for ABI generated docs where needed
+            matches = self.re_abi.findall(d)
+            for m in matches:
+                abi = m[0] + m[1]
+
+                xref = self.file_refs.get(abi)
+                if not xref:
+                    # This may happen if ABI is on a separate directory,
+                    # like parsing ABI testing and symbol is at stable.
+                    # The proper solution is to move this part of the code
+                    # for it to be inside sphinx/kernel_abi.py
+                    self.log.info("Didn't find ABI reference for '%s'", abi)
+                else:
+                    new = self.re_escape.sub(r"\\\1", m[1])
+                    d = re.sub(fr"\b{abi}\b", f":ref:`{new} <{xref}>`", d)
+
+            # Seek for cross reference symbols like /sys/...
+            # Need to be careful to avoid doing it on a code block
+            if d[0] not in [" ", "\t"]:
+                matches = self.re_xref_node.findall(d)
+                for m in matches:
+                    # Finding ABI here is more complex due to wildcards
+                    xref = self.what_refs.get(m)
+                    if xref:
+                        new = self.re_escape.sub(r"\\\1", m)
+                        d = re.sub(fr"\b{m}\b", f":ref:`{new} <{xref}>`", d)
+
+            new_desc += d + "\n"
+
+        print(new_desc + "\n")
+
+    def print_data(self, enable_lineno, output_in_txt, show_file=False):
+        """Print ABI at stdout"""
+
+        part = None
+        for key, v in sorted(self.data.items(),
+                             key=lambda x: (x[1].get("type", ""),
+                                            x[1].get("what"))):
+
+            wtype = v.get("type", "Var")
+            file_ref = v.get("file")
+            names = v.get("what", [""])
+
+            if not show_file and wtype == "File":
+                continue
+
+            if enable_lineno:
+                ln = v.get("line_no", 1)
+                print(f".. LINENO {file_ref[0][0]}#{ln}\n")
+
+            if wtype != "File":
+                cur_part = names[0]
+                if cur_part.find("/") >= 0:
+                    match = self.re_what.match(cur_part)
+                    if match:
+                        symbol = match.group(1).rstrip("/")
+                        cur_part = "Symbols under " + symbol
+
+                if cur_part and cur_part != part:
+                    part = cur_part
+                    print(f"{part}\n{"-" * len(part)}\n")
+
+                print(f".. _{key}:\n")
+
+                max_len = 0
+                for i in range(0, len(names)):           # pylint: disable=C0200
+                    names[i] = "**" + self.re_escape.sub(r"\\\1", names[i]) + "**"
+
+                    max_len = max(max_len, len(names[i]))
+
+                print("+-" + "-" * max_len + "-+")
+                for name in names:
+                    print(f"| {name}" + " " * (max_len - len(name)) + " |")
+                    print("+-" + "-" * max_len + "-+")
+                print()
+
+            for ref in file_ref:
+                if wtype == "File":
+                    print(f".. _{ref[1]}:\n")
+                else:
+                    base = os.path.basename(ref[0])
+                    print(f"Defined on file :ref:`{base} <{ref[1]}>`\n")
+
+            if wtype == "File":
+                print(f"{names[0]}\n{"-" * len(names[0])}\n")
+
+            desc = v.get("description")
+            if not desc and wtype != "File":
+                print(f"DESCRIPTION MISSING for {names[0]}\n")
+
+            if desc:
+                if output_in_txt:
+                    self.print_desc_txt(desc)
+                else:
+                    self.print_desc_rst(desc)
+
+            symbols = v.get("symbols")
+            if symbols:
+                print("Has the following ABI:\n")
+
+                for w, label in symbols:
+                    # Escape special chars from content
+                    content = self.re_escape.sub(r"\\\1", w)
+
+                    print(f"- :ref:`{content} <{label}>`\n")
+
+            users = v.get("users")
+            if users and users.strip(" \t\n"):
+                print(f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n")
+
+    def check_issues(self):
+        """Warn about duplicated ABI entries"""
+
+        for what, v in self.what_symbols.items():
+            files = v.get("file")
+            if not files:
+                # Should never happen if the parser works properly
+                self.log.warning("%s doesn't have a file associated", what)
+                continue
+
+            if len(files) == 1:
+                continue
+
+            f = []
+            for fname, lines in sorted(files.items()):
+                if not lines:
+                    f.append(f"{fname}")
+                elif len(lines) == 1:
+                    f.append(f"{fname}:{lines[0]}")
+                else:
+                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+
+            self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
diff --git a/scripts/lib/abi/helpers.py b/scripts/lib/abi/helpers.py
new file mode 100644
index 000000000000..84a253ed5058
--- /dev/null
+++ b/scripts/lib/abi/helpers.py
@@ -0,0 +1,28 @@
+#!/usr/bin/env python3
+# Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
+# pylint: disable=R0903
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Helper classes for ABI parser
+"""
+
+ABI_DIR = "Documentation/ABI/"
+
+
+class AbiDebug:
+    """Debug levels"""
+
+    WHAT_PARSING = 1
+    WHAT_OPEN = 2
+    DUMP_ABI_STRUCTS = 4
+
+
+DEBUG_HELP = """
+Print debug information according with the level(s),
+which is given by the following bitmask:
+
+1  - enable debug parsing logic
+2  - enable debug messages on file open
+4  - enable debug for ABI parse data
+"""
-- 
2.48.1

